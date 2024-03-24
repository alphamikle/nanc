import 'dart:convert';

import 'package:config/config.dart';
import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../dto/column_info_dto.dart';
import 'supabase_api.dart';
import 'supabase_model_api_config.dart';

const String kReturnableArgumentName = 'returnable';
const String kConstraintSuffix = '_nanc_constraint';

class SupabaseModelApi implements IModelApi {
  SupabaseModelApi({
    required SupabaseApi api,
    required this.config,
  }) : _api = api;

  final SupabaseApi _api;
  final SupabaseModelApiConfig config;

  bool get _doNothingMode => config.doNothingMode;

  String get _funcName => config.executorFunctionName;

  String get _sqlQueryName => config.executorSqlArgumentName;

  String get _returnableName => config.executorReturnableArgumentName;

  bool get _deleteColumns => config.deleteUnnecessaryColumns;

  bool get _notChangeTypes => config.changeDifferentTypes == false;

  @override
  Future<void> createModelRelatedTable(Model newModel, Model? oldModel) async {
    if (_doNothingMode) {
      return;
    }
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
      final (String checkName, String checkSql) = fieldToSupabaseCheckCondition(newModel, field);
      final bool hasCheck = checkName.isNotEmpty;
      final bool isNullable = field.isRequired == false;
      if (fieldPk.isNotEmpty) {
        // TODO(alphamikle): That means - for now we can have only one PK
        isPkUsed = true;
      }
      // TODO(alphamikle): Add references
      createCommands.add('"$id" $type $fieldPk ${isNullable ? 'NULL' : 'NOT NULL'} ${hasCheck ? 'CONSTRAINT "$checkName" $checkSql' : ''}');
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

      if (field is NumberField) {
        /// DROPPING ALL Nanc CONSTRAINTS FOR THE FIELD
        constraintCommands.add('''
        BEGIN
          EXECUTE (
            SELECT format('ALTER TABLE %s DROP CONSTRAINT IF EXISTS %s', conrelid::regclass, conname)
            FROM   pg_constraint con
            JOIN   pg_attribute a ON a.attnum = ANY(con.conkey)
            WHERE  conname LIKE '%$kConstraintSuffix' AND a.attname = '$id'
            LIMIT  1
          );
        EXCEPTION
          WHEN others THEN
            -- DO NOTHING - THAT MEANS THERE ARE NO ANY CONSTRAINTS WERE FOUND
        END;
        ''');
        if (checkName.isNotEmpty) {
          /// ADD NEW ONE IF IT IS EXISTS
          constraintCommands.add('''
              IF NOT EXISTS (
                  SELECT 1
                  FROM pg_constraint
                  WHERE conrelid = '$table'::regclass::oid
                    AND conname = '$checkName'
              ) THEN
                  ALTER TABLE "$table"
                  ADD CONSTRAINT "$checkName" $checkSql;
              END IF;
            ''');
        }
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
            -- CREATING NEW TABLE BLOCK
            CREATE TABLE "$table" (
                ${createCommands.join(',\n')}
            );
            ALTER TABLE "$table"
            ENABLE ROW LEVEL SECURITY;
        ELSE
            -- ALTERING EXISTED TABLE BLOCK
            ${alterCommands.join('\n            ')}
        END IF;
        ${constraintCommands.isNotEmpty ? '-- CONSTRAINTS BLOCK START' : ''}
        ${constraintCommands.join('\n            ')}
        ${constraintCommands.isNotEmpty ? '-- CONSTRAINTS BLOCK END' : ''}
        
        ${thirdTableCommands.isNotEmpty ? '-- THIRD TABLE BLOCK START' : ''}
        ${thirdTableCommands.join('\n            ')}
        ${thirdTableCommands.isNotEmpty ? '-- THIRD TABLE BLOCK END' : ''}
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
    } catch (error, stackTrace) {
      logError('Error on updating model\'s related table', error: error, stackTrace: stackTrace);
      rethrow;
    }
  }

  String fieldToSupabaseType(Model model, Field field) {
    return switch (field) {
      BinaryField() => 'bytea',
      BoolField() => 'bool',
      ColorField() => 'varchar(10)',
      // TODO(alphamikle): Refactor after splitting DateTime to Date / Time / DateTime fields
      DateTimeField() => 'timestamptz',
      EnumField() => 'text',
      FontField() => 'varchar(256)',
      HeaderField() => 'text',
      IconField() => 'varchar(150)',
      ModelsSelectorField() => 'text',
      MultiSelectorField() => 'text',
      NumberField() => numberFieldToSupabaseType(model, field),
      QueryFilterField() => 'text',
      QueryFilterValueField() => 'text',
      ScreenField() => 'jsonb',
      // TODO(alphamikle): Assign type by the information from the related table (selectorField.model)
      SelectorField() => 'uuid',
      StringField() => 'text',
      StructureField() => 'jsonb',
      StructuredField() => 'jsonb',
      DynamicField() => 'jsonb',
      // TODO(alphamikle): Refactor after IdField will be able to store int or "text" data
      IdField() => model.isCollection ? 'uuid' : 'text',
      Field() => 'text',
    };
  }

  String numberFieldToSupabaseType(Model model, NumberField field) {
    return switch ((field.numberType, field.signType)) {
      (NumberType.bit, SignType.signed) => 'bit(1)',
      (NumberType.bit, SignType.unsigned) => 'bit(1)',
      (NumberType.float, SignType.signed) => 'float4',

      /// [float8] using instead of float4, because Postgres doesn't support unsigned numbers and positive limit of signed float4 is less that unsigned float4
      /// The same logic would be applied to all below fields
      (NumberType.float, SignType.unsigned) => 'float8', // CHECK ("$fieldId" >= 0)
      (NumberType.double, SignType.signed) => 'float8',
      (NumberType.double, SignType.unsigned) => 'float8', // CHECK ("$fieldId" >= 0)
      (NumberType.tinyInt, SignType.signed) => 'int2', // CHECK ("$fieldId" >= -128 AND "$fieldId" <= 127)
      (NumberType.tinyInt, SignType.unsigned) => 'int2', // CHECK ("$fieldId" >= 0 AND "$fieldId" <= 255)
      (NumberType.smallInt, SignType.signed) => 'int2',
      (NumberType.smallInt, SignType.unsigned) => 'int4', // CHECK ("$fieldId" >= 0 AND "$fieldId" <= 65535)
      (NumberType.mediumInt, SignType.signed) => 'int4', // CHECK ("$fieldId" >= -8388608 AND "$fieldId" <= 8388607)
      (NumberType.mediumInt, SignType.unsigned) => 'int4', // CHECK ("$fieldId" >= 0 AND "$fieldId" <= 16777215)
      (NumberType.integer, SignType.signed) => 'int4',
      (NumberType.integer, SignType.unsigned) => 'bigint', // CHECK ("$fieldId" >= 0 AND "$fieldId" <= 4294967295)
      (NumberType.bigInt, SignType.signed) => 'bigint',
      (NumberType.bigInt, SignType.unsigned) => 'bigint', // CHECK ("$fieldId" >= 0)
    };
  }

  (String name, String code) fieldToSupabaseCheckCondition(Model model, Field field) {
    return switch (field) {
      BinaryField() => ('', ''),
      BoolField() => ('', ''),
      ColorField() => ('', ''),
      DateTimeField() => ('', ''),
      EnumField() => ('', ''),
      FontField() => ('', ''),
      HeaderField() => ('', ''),
      IconField() => ('', ''),
      ModelsSelectorField() => ('', ''),
      MultiSelectorField() => ('', ''),
      NumberField() => numberFieldToSupabaseCheckCondition(model, field),
      QueryFilterField() => ('', ''),
      QueryFilterValueField() => ('', ''),
      ScreenField() => ('', ''),
      SelectorField() => ('', ''),
      StringField() => ('', ''),
      StructureField() => ('', ''),
      StructuredField() => ('', ''),
      DynamicField() => ('', ''),
      IdField() => ('', ''),
      Field() => ('', ''),
    };
  }

  (String name, String code) numberFieldToSupabaseCheckCondition(Model model, NumberField field) {
    final String fieldId = field.id;

    return switch ((field.numberType, field.signType)) {
      (NumberType.bit, SignType.signed) => ('', ''),
      (NumberType.bit, SignType.unsigned) => ('', ''),
      (NumberType.float, SignType.signed) => ('', ''),

      /// [float8] using instead of float4, because Postgres doesn't support unsigned numbers and positive limit of signed float4 is less that unsigned float4
      /// The same logic would be applied to all below fields
      (NumberType.float, SignType.unsigned) => ('${fieldId}_unsigned_float$kConstraintSuffix', 'CHECK ("$fieldId" >= 0)'),
      (NumberType.double, SignType.signed) => ('', ''),
      (NumberType.double, SignType.unsigned) => ('${fieldId}_unsigned_double$kConstraintSuffix', 'CHECK ("$fieldId" >= 0)'),
      (NumberType.tinyInt, SignType.signed) => ('${fieldId}_signed_tiny_int$kConstraintSuffix', 'CHECK ("$fieldId" >= -128 AND "$fieldId" <= 127)'),
      (NumberType.tinyInt, SignType.unsigned) => ('${fieldId}_unsigned_tiny_int$kConstraintSuffix', 'CHECK ("$fieldId" >= 0 AND "$fieldId" <= 255)'),
      (NumberType.smallInt, SignType.signed) => ('', ''),
      (NumberType.smallInt, SignType.unsigned) => ('${fieldId}_unsigned_small_int$kConstraintSuffix', 'CHECK ("$fieldId" >= 0 AND "$fieldId" <= 65535)'),
      (NumberType.mediumInt, SignType.signed) => ('${fieldId}_signed_medium_int$kConstraintSuffix', 'CHECK ("$fieldId" >= -8388608 AND "$fieldId" <= 8388607)'),
      (NumberType.mediumInt, SignType.unsigned) => ('${fieldId}_unsigned_medium_int$kConstraintSuffix', 'CHECK ("$fieldId" >= 0 AND "$fieldId" <= 16777215)'),
      (NumberType.integer, SignType.signed) => ('', ''),
      (NumberType.integer, SignType.unsigned) => ('${fieldId}_unsigned_integer$kConstraintSuffix', 'CHECK ("$fieldId" >= 0 AND "$fieldId" <= 4294967295)'),
      (NumberType.bigInt, SignType.signed) => ('', ''),
      (NumberType.bigInt, SignType.unsigned) => ('${fieldId}_unsigned_bigint$kConstraintSuffix', 'CHECK ("$fieldId" >= 0)'),
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

  @override
  Future<void> deleteModel(Model model) async {}
}
