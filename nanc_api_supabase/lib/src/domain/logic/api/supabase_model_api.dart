import 'dart:convert';

import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';

import '../dto/column_info_dto.dart';
import 'supabase_api.dart';
import 'supabase_model_api_config.dart';

const String kReturnableArgumentName = 'returnable';

class SupabaseModelApi implements IModelApi {
  SupabaseModelApi({
    required SupabaseApi api,
    required this.config,
  }) : _api = api;

  final SupabaseApi _api;
  final SupabaseModelApiConfig config;

  String get _funcName => config.executorFunctionName;
  String get _sqlQueryName => config.executorSqlArgumentName;
  String get _returnableName => config.executorReturnableArgumentName;
  bool get _deleteColumns => config.deleteUnnecessaryColumns;
  bool get _notChangeTypes => config.changeDifferentTypes == false;

  @override
  Future<void> createModelRelatedTable(Model newModel, Model? oldModel) async {
    final String table = newModel.id;
    final List<String> createCommands = [];
    final List<String> alterCommands = [];
    final List<String> constraintCommands = [];
    final List<String> thirdTableCommands = [];
    bool isPkUsed = false;
    final List<Field> realFields = newModel.flattenFields.realFields;
    final List<MultiSelectorField> multiSelectorFields = newModel.flattenFields.whereType<MultiSelectorField>().toList();

    for (final Field field in realFields) {
      final String id = field.id;
      final String fieldPk = primaryKey(newModel, field, pkUsed: isPkUsed);
      final String type = fieldToSupabaseType(newModel, field);
      final bool isNullable = field.isRequired == false;
      if (fieldPk.isNotEmpty) {
        // TODO(alphamikle): That means - for we can have only one PK
        isPkUsed = true;
      }
      // TODO(alphamikle): Add references
      createCommands.add('"$id" $type $fieldPk ${isNullable ? 'NULL' : 'NOT NULL'}');
      alterCommands.add('''
        IF NOT EXISTS (
            SELECT 1
            FROM information_schema.columns
            WHERE table_name = '$table'
            AND column_name = '$id'
        ) THEN
            ALTER TABLE "$table"
            ADD COLUMN "$id" $type ${isNullable ? 'NULL' : 'NOT NULL'};
            ${_notChangeTypes ? '-- ' : ''}ELSE
                ${_notChangeTypes ? '-- ' : ''}ALTER TABLE "$table"
                ${_notChangeTypes ? '-- ' : ''}ALTER COLUMN "$id" SET DATA TYPE $type USING "$id"::$type,
                ${_notChangeTypes ? '-- ' : ''}ALTER COLUMN "$id" ${isNullable ? 'DROP NOT NULL' : 'SET NOT NULL'};
        END IF;
''');
      if (field is SelectorField) {
        final String onDelete = field.isRequired ? 'ON DELETE RESTRICT' : 'ON DELETE SET NULL';
        final String constraintName = '${field.model.id}_${field.model.idField.id}_${field.id}_fkey';
        constraintCommands.add('''
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conrelid = '$table'::regclass::oid
          AND conname = '$constraintName'
    ) THEN
        ALTER TABLE "$table"
        ADD CONSTRAINT "$constraintName" FOREIGN KEY ("$id") REFERENCES "${field.model.id}" (${field.model.idField.id}) $onDelete;
    END IF;
''');
      }
    }

    for (final MultiSelectorField field in multiSelectorFields) {
      final Model thirdTableModel = field.thirdTable.relationsEntity;
      final String thirdTable = thirdTableModel.id;
      final String parentId = field.thirdTable.parentEntityIdName;
      final String childId = field.thirdTable.childEntityIdName;
      final String parentConstraintName = '${newModel.id}_${newModel.idField.id}_${parentId}_fkey';
      final String childConstraintName = '${field.model.id}_${field.model.idField.id}_${childId}_fkey';
      final String onDeleteParentId =
          thirdTableModel.fieldById(field.thirdTable.parentEntityIdName)?.isRequired ?? false ? 'ON DELETE RESTRICT' : 'ON DELETE SET NULL';
      final String onDeleteChildId =
          thirdTableModel.fieldById(field.thirdTable.childEntityIdName)?.isRequired ?? false ? 'ON DELETE RESTRICT' : 'ON DELETE SET NULL';

      /// Handle of parent id field of the third table
      thirdTableCommands.add('''
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conrelid = '$thirdTable'::regclass::oid
          AND conname = '$parentId'
    ) THEN
        ALTER TABLE "$thirdTable"
        ADD CONSTRAINT "$parentConstraintName" FOREIGN KEY ("$parentId") REFERENCES "${newModel.id}" (${newModel.idField.id}) $onDeleteParentId;
    END IF;
''');

      /// Handle of child id field of the third table
      thirdTableCommands.add('''
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conrelid = '$thirdTable'::regclass::oid
          AND conname = '$childId'
    ) THEN
        ALTER TABLE "$thirdTable"
        ADD CONSTRAINT "$childConstraintName" FOREIGN KEY ("$childId") REFERENCES "${field.model.id}" (${field.model.idField.id}) $onDeleteChildId;
    END IF;
''');
    }

    final String sql = '''
DO \$\$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = '$table') THEN
        -- Create new table
        CREATE TABLE "$table" (
            ${createCommands.join(',\n')}
        );
        ALTER TABLE "$table"
        ENABLE ROW LEVEL SECURITY;
    ELSE
        -- Altering existing table
        ${alterCommands.join('\n')}
    END IF;
    ${constraintCommands.isNotEmpty ? '-- Add / update constraints' : '-- Do nothing'}
    ${constraintCommands.join('\n')}
    
    ${thirdTableCommands.isNotEmpty ? '-- Ruling third table' : '-- Do nothing'}
    ${thirdTableCommands.join('\n')}
END \$\$;
''';

    try {
      await deleteOutdatedFields(newModel, newModel.flattenFields.realFields);
      await _api.client.rpc(
        _funcName,
        params: {
          _sqlQueryName: sql,
          _returnableName: false,
        },
      );
    } catch (error, stack) {
      logg.rows(error, stack);
    }
  }

  String fieldToSupabaseType(Model model, Field field) {
    return switch (field) {
      BoolField() => 'bool',
      ColorField() => 'varchar(10)',
      // TODO(alphamikle): Refactor after splitting DateTime to Date / Time / DateTime fields
      DateTimeField() => 'timestamptz',
      DynamicField() => 'jsonb',
      EnumField() => 'text',
      FontField() => 'varchar(256)',
      HeaderField() => 'text',
      IconField() => 'varchar(150)',
      ModelsSelectorField() => 'text',
      MultiSelectorField() => 'text',
      // TODO(alphamikle): Refactor after NumberField will become int / float and will have a precision
      NumberField() => 'float8',
      QueryFilterField() => 'text',
      QueryFilterValueField() => 'text',
      ScreenField() => 'jsonb',
      // TODO(alphamikle): Assign type by the information from the related table (selectorField.model)
      SelectorField() => 'uuid',
      StringField() => 'text',
      StructureField() => 'jsonb',
      StructuredField() => 'jsonb',
      // TODO(alphamikle): Refactor after IdField will be able to store int or "text" data
      IdField() => 'uuid',
      Field() => 'text',
    };
  }

  @protected
  String primaryKey(Model model, Field field, {bool pkUsed = false}) {
    if (pkUsed == false && field is IdField) {
      return 'PRIMARY KEY';
    }
    return '';
  }

  Future<void> deleteOutdatedFields(Model model, List<Field> realFields) async {
    if (_deleteColumns == false) {
      return;
    }
    final String requestQuery = '''
SELECT jsonb_agg(jsonb_build_object(
    'column_name', column_name,
    'data_type', data_type,
    'is_nullable', is_nullable,
    'character_maximum_length', character_maximum_length
)) AS json_data
FROM information_schema.columns
WHERE table_name = '${model.id}';
''';
    final String? response = await _api.client.rpc(
      _funcName,
      params: {
        _sqlQueryName: requestQuery,
        _returnableName: true,
      },
    );
    if (response == null) {
      return;
    }
    final Set<String> newFieldsIds = realFields.ids.toSet();
    final List<String> deleteOldFieldCommands = [];
    final List<dynamic> rawJson = jsonDecode(response);
    final List<ColumnInfoDto> columnsInfo = rawJson.map(ColumnInfoDto.fromJson).toList();
    for (final ColumnInfoDto(:String columnName) in columnsInfo) {
      if (newFieldsIds.contains(columnName) == false) {
        deleteOldFieldCommands.add('DROP COLUMN "$columnName"');
      }
    }
    if (deleteOldFieldCommands.isNotEmpty) {
      final String deleteQuery = '''
ALTER TABLE ${model.id}
${deleteOldFieldCommands.join(',\n')}
''';
      await _api.client.rpc(
        _funcName,
        params: {
          _sqlQueryName: deleteQuery,
          _returnableName: false,
        },
      );
    }
  }
}
