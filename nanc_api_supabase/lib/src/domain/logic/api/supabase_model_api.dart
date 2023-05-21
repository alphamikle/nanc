import 'dart:convert';

import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';

import '../dto/column_info_dto.dart';
import 'supabase_api.dart';

const String kReturnableArgumentName = 'returnable';

class SupabaseModelApi implements IModelApi {
  SupabaseModelApi({
    required SupabaseApi api,
    required this.executorFunctionName,
    required this.executorFunctionQueryArgumentName,
    required this.executorFunctionReturnableArgumentName,
  }) : _api = api;

  final SupabaseApi _api;
  final String executorFunctionName;
  final String executorFunctionQueryArgumentName;
  final String executorFunctionReturnableArgumentName;

  @override
  Future<void> createModelRelatedTable(Model newModel, Model? oldModel) async {
    final String table = newModel.id;
    final List<String> createColumns = [];
    final List<String> alterColumns = [];
    bool pkUsed = false;

    for (final Field field in newModel.flattenFields.realFields) {
      final String id = field.id;
      final String fieldPk = primaryKey(newModel, field, pkUsed: pkUsed);
      final String type = fieldToSupabaseType(newModel, field);
      if (fieldPk.isNotEmpty) {
        pkUsed = true;
      }
      // TODO(alphamikle): Add references
      createColumns.add('"$id" $type $fieldPk');
      alterColumns.add('ADD COLUMN IF NOT EXISTS "$id" $type');
    }

    final String sql = '''
DO \$\$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = '$table') THEN
        CREATE TABLE $table (
            ${createColumns.join(',\n')}
        );
    ELSE
        ALTER TABLE $table
        ${alterColumns.join(',\n')}
        ;
    END IF;
    -- Добавление отсутствующих ограничений (если требуется)
    -- ALTER TABLE $table
    -- ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users (id),
    -- ADD CONSTRAINT fk_color FOREIGN KEY (color_id) REFERENCES colors (id)
    -- ;
END \$\$;
''';

    try {
      await deleteOutdatedFields(newModel, newModel.flattenFields.realFields);
      await _api.client.rpc(
        executorFunctionName,
        params: {
          executorFunctionQueryArgumentName: sql,
          executorFunctionReturnableArgumentName: false,
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
      DateTimeField() => 'timestampz',
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
      ScreenField() => 'text',
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
      executorFunctionName,
      params: {
        executorFunctionQueryArgumentName: requestQuery,
        executorFunctionReturnableArgumentName: true,
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
        executorFunctionName,
        params: {
          executorFunctionQueryArgumentName: deleteQuery,
          executorFunctionReturnableArgumentName: false,
        },
      );
    }
  }
}
