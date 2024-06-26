import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../model/logic/model/logic/model.dart';
import '../../ui/bool_field_cell/bool_field_cell.dart';
import '../../ui/color_field_cell/color_field_cell.dart';
import '../../ui/date_field_cell/date_field_cell.dart';
import '../../ui/dynamic_field_cell/dynamic_field_cell.dart';
import '../../ui/enum_field_cell/enum_field_cell.dart';
import '../../ui/field_cell_mixin.dart';
import '../../ui/font_field_cell/font_field_cell.dart';
import '../../ui/header_field/header_field_cell.dart';
import '../../ui/icon_field_cell/icon_field_cell.dart';
import '../../ui/id_field_cell/id_field_cell.dart';
import '../../ui/models_selector_field/models_selector_field_cell.dart';
import '../../ui/multi_selector_field_cell/multi_selector_field_cell.dart';
import '../../ui/multiline_string_field_cell/string_field_cell.dart';
import '../../ui/number_field_cell/number_field_cell.dart';
import '../../ui/query_filter_cell/query_filter_cell.dart';
import '../../ui/query_filter_value_field_cell/query_filter_value_field_cell.dart';
import '../../ui/screen_field_cell/screen_field_cell.dart';
import '../../ui/selector_field_cell/selector_field_cell.dart';
import '../../ui/structure_field_cell/structure_field_cell.dart';
import '../../ui/structured_field_cell/structured_field_cell.dart';
import '../../ui/structured_field_cell/structured_field_item.dart';
import '../fields/binary_field/binary_field.dart';
import '../fields/bool_field/bool_field.dart';
import '../fields/color_field/color_field.dart';
import '../fields/date_time_field/date_time_field.dart';
import '../fields/dynamic_field/dynamic_field.dart';
import '../fields/dynamic_field/dynamic_field_item.dart';
import '../fields/enum_field/enum_field.dart';
import '../fields/enum_field/enum_value.dart';
import '../fields/field/field.dart';
import '../fields/field/field_props.dart';
import '../fields/font_field/font_field.dart';
import '../fields/header_field/header_field.dart';
import '../fields/icon_field/icon_field.dart';
import '../fields/id_field/id_field.dart';
import '../fields/models_selector_field/models_selector_field.dart';
import '../fields/multi_selector_field/multi_selector_field.dart';
import '../fields/number_field/number_field.dart';
import '../fields/query_filter_field/query_filter_field.dart';
import '../fields/query_filter_value_field/query_filter_value_field.dart';
import '../fields/screen_field/screen_field.dart';
import '../fields/selector_field/selector_field.dart';
import '../fields/string_field/string_field.dart';
import '../fields/structure_field/structure_field.dart';
import '../fields/structured_field/structured_field.dart';
import '../third_table/third_table.dart';
import '../type/field_types.dart';

abstract class FieldMapper {
  static T deepClone<T extends Field>(T field) {
    final FieldType type = field.type;

    if (type == FieldType.binaryField) {
      return (field as BinaryField).copyWith() as T;
    } else if (type == FieldType.boolField) {
      return (field as BoolField).copyWith() as T;
    } else if (type == FieldType.colorField) {
      return (field as ColorField).copyWith() as T;
    } else if (type == FieldType.dateField) {
      return (field as DateTimeField).copyWith() as T;
    } else if (type == FieldType.enumField) {
      return (field as EnumField).copyWith(values: field.values.map((EnumValue value) => value.copyWith()).toList()) as T;
    } else if (type == FieldType.fontField) {
      return (field as FontField).copyWith() as T;
    } else if (type == FieldType.headerField) {
      return (field as HeaderField).copyWith() as T;
    } else if (type == FieldType.iconField) {
      return (field as IconField).copyWith() as T;
    } else if (type == FieldType.idField) {
      return (field as IdField).copyWith() as T;
    } else if (type == FieldType.modelsSelectorField) {
      return (field as ModelsSelectorField).copyWith() as T;
    } else if (type == FieldType.stringField) {
      return (field as StringField).copyWith() as T;
    } else if (type == FieldType.multiSelectorField) {
      final ThirdTable thirdTable = (field as MultiSelectorField).thirdTable;
      final Model model = field.model;
      return field.copyWith(
        model: model.deepClone(),
        thirdTable: thirdTable.copyWith(
          relationsEntity: thirdTable.relationsEntity.deepClone(),
        ),
      ) as T;
    } else if (type == FieldType.numberField) {
      return (field as NumberField).copyWith() as T;
    } else if (type == FieldType.queryFilterField) {
      return (field as QueryFilterField).copyWith() as T;
    } else if (type == FieldType.queryFilterValueField) {
      return (field as QueryFilterValueField).copyWith() as T;
    } else if (type == FieldType.screenField) {
      return (field as ScreenField).copyWith() as T;
    } else if (type == FieldType.selectorField) {
      return (field as SelectorField).copyWith(
        model: field.model.copyWith(),
      ) as T;
    } else if (type == FieldType.structureField) {
      return (field as StructureField).copyWith() as T;
    } else if (type == FieldType.structuredField) {
      final StructuredField structuredField = field as StructuredField;
      final List<Field> structure = structuredField.structure;
      return structuredField.copyWith(
        structure: structure.map((e) => FieldMapper.deepClone(e)).toList(),
      ) as T;
    } else if (type == FieldType.dynamicField) {
      return (field as DynamicField).copyWith() as T;
    }
    // TODO(alphamikle): [FIELDS] Add new fields here
    throw UnimplementedError('Not found deepClone factory for $Field with type "$type"');
  }

  static Widget fieldToInput({
    required Field field,
    required bool creationMode,
    int? deepLevel,

    /// ? Dynamic Field recursive callback
    ValueChanged<List<DynamicFieldItem>>? onChangeChildStructure,

    /// ? Structured field recursive callback
    ValueChanged<List<StructuredFieldItem>>? onChildChange,

    /// ? Dynamic field recursive initial data
    List<DynamicFieldItem>? initialChildrenData,
  }) {
    if (field is BinaryField) {
      // TODO(alphamikle): If the binary field will be used - it's need to be implemented
      return const SizedBox.shrink();
    } else if (field is BoolField) {
      return BoolFieldCell(field: field, creationMode: creationMode);
    } else if (field is ColorField) {
      return ColorFieldCell(field: field, creationMode: creationMode);
    } else if (field is DateTimeField) {
      return DateFieldCell(field: field, creationMode: creationMode);
    } else if (field is EnumField) {
      return EnumFieldCell(field: field, creationMode: creationMode);
    } else if (field is FontField) {
      return FontFieldCell(field: field, creationMode: creationMode);
    } else if (field is HeaderField) {
      return HeaderFieldCell(field: field);
    } else if (field is IconField) {
      return IconFieldCell(field: field, creationMode: creationMode);
    } else if (field is IdField) {
      return IdFieldCell(field: field, creationMode: creationMode);
    } else if (field is ModelsSelectorField) {
      return ModelsSelectorFieldCell(field: field, creationMode: creationMode);
    } else if (field is StringField) {
      return StringFieldCell(field: field, creationMode: creationMode);
    } else if (field is MultiSelectorField) {
      return MultiSelectorFieldCell(field: field, creationMode: creationMode);
    } else if (field is NumberField) {
      return NumberFieldCell(field: field, creationMode: creationMode);
    } else if (field is QueryFilterField) {
      return QueryFilterCell(
        field: field,
        creationMode: creationMode,
        onChildChange: onChildChange,
        deepLevel: deepLevel ?? 0,
      );
    } else if (field is QueryFilterValueField) {
      return QueryFilterValueFieldCell(field: field, creationMode: creationMode);
    } else if (field is ScreenField) {
      return ScreenFieldCell(field: field, creationMode: creationMode);
    } else if (field is SelectorField) {
      return SelectorFieldCell(field: field, creationMode: creationMode);
    } else if (field is StructureField) {
      return StructureFieldCell(field: field, creationMode: creationMode);
    } else if (field is StructuredField) {
      return StructuredFieldCell(
        field: field,
        creationMode: creationMode,
        onChildChange: onChildChange,
        deepLevel: deepLevel ?? 0,
      );
    } else if (field is DynamicField) {
      return DynamicFieldCell(
        field: field,
        creationMode: creationMode,
        deepLevel: deepLevel ?? 0,
        onChangeChildStructure: onChangeChildStructure,
        initialChildrenData: initialChildrenData ?? [],
      );
    }
    // TODO(alphamikle): [FIELDS] Add new fields here
    final String warning = '$field mapper is not implemented!';
    logInfo('$warning\n${StackTrace.current}');
    return ErrorFieldCell(warning: warning);
  }

  static Json fieldToJson(Field field) {
    final String fieldTypeRepresentation = field.runtimeType.toString();

    if (field is BinaryField) {
      return field.toJson();
    } else if (field is BoolField) {
      return field.toJson();
    } else if (field is ColorField) {
      return field.toJson();
    } else if (field is DateTimeField) {
      return field.toJson();
    } else if (field is EnumField) {
      return field.toJson();
    } else if (field is FontField) {
      return field.toJson();
    } else if (field is HeaderField) {
      return field.toJson();
    } else if (field is IconField) {
      return field.toJson();
    } else if (field is IdField) {
      return field.toJson();
    } else if (field is ModelsSelectorField) {
      return field.toJson();
    } else if (field is StringField) {
      return field.toJson();
    } else if (field is MultiSelectorField) {
      return field.toJson();
    } else if (field is NumberField) {
      return field.toJson();
    } else if (field is QueryFilterField) {
      return field.toJson();
    } else if (field is QueryFilterValueField) {
      return field.toJson();
    } else if (field is ScreenField) {
      return field.toJson();
    } else if (field is SelectorField) {
      return field.toJson();
    } else if (field is StructureField) {
      return field.toJson();
    } else if (field is StructuredField) {
      return field.toJson();
    } else if (field is DynamicField) {
      return field.toJson();
    }
    // TODO(alphamikle): [FIELDS] Add new fields here
    throw UnimplementedError('Not found json encoder for field "$fieldTypeRepresentation"');
  }

  static T jsonToField<T extends Field>(dynamic json) {
    final String? type = json[fieldTypeProperty] as String?;
    if (type == null) {
      throw Exception('Json representation of "$Field" should contain a value with key "$fieldTypeProperty"');
    }
    if (type == FieldType.binaryField.name) {
      return BinaryField.fromJson(json) as T;
    } else if (type == FieldType.boolField.name) {
      return BoolField.fromJson(json) as T;
    } else if (type == FieldType.colorField.name) {
      return ColorField.fromJson(json) as T;
    } else if (type == FieldType.dateField.name) {
      return DateTimeField.fromJson(json) as T;
    } else if (type == FieldType.enumField.name) {
      return EnumField.fromJson(json) as T;
    } else if (type == FieldType.fontField.name) {
      return FontField.fromJson(json) as T;
    } else if (type == FieldType.headerField.name) {
      return HeaderField.fromJson(json) as T;
    } else if (type == FieldType.iconField.name) {
      return IconField.fromJson(json) as T;
    } else if (type == FieldType.idField.name) {
      return IdField.fromJson(json) as T;
    } else if (type == FieldType.modelsSelectorField.name) {
      return ModelsSelectorField.fromJson(json) as T;
    } else if (type == FieldType.stringField.name) {
      return StringField.fromJson(json) as T;
    } else if (type == FieldType.multiSelectorField.name) {
      return MultiSelectorField.fromJson(json) as T;
    } else if (type == FieldType.numberField.name) {
      return NumberField.fromJson(json) as T;
    } else if (type == FieldType.queryFilterField.name) {
      return QueryFilterField.fromJson(json) as T;
    } else if (type == FieldType.queryFilterValueField.name) {
      return QueryFilterValueField.fromJson(json) as T;
    } else if (type == FieldType.screenField.name) {
      return ScreenField.fromJson(json) as T;
    } else if (type == FieldType.selectorField.name) {
      return SelectorField.fromJson(json) as T;
    } else if (type == FieldType.structureField.name) {
      return StructureField.fromJson(json) as T;
    } else if (type == FieldType.structuredField.name) {
      return StructuredField.fromJson(json) as T;
    } else if (type == FieldType.dynamicField.name) {
      return DynamicField.fromJson(json) as T;
    }
    // TODO(alphamikle): [FIELDS] Add new fields here
    throw UnimplementedError('Not found json decoder for field "$type"');
  }

  static Model fieldTypeToEntity(FieldType fieldType) {
    if (fieldType == FieldType.binaryField) {
      return BinaryField.empty().toModel();
    } else if (fieldType == FieldType.boolField) {
      return BoolField.empty().toModel();
    } else if (fieldType == FieldType.colorField) {
      return ColorField.empty().toModel();
    } else if (fieldType == FieldType.dateField) {
      return DateTimeField.empty().toModel();
    } else if (fieldType == FieldType.enumField) {
      return EnumField.empty().toModel();
    } else if (fieldType == FieldType.fontField) {
      return FontField.empty().toModel();
    } else if (fieldType == FieldType.headerField) {
      return HeaderField.empty().toModel();
    } else if (fieldType == FieldType.iconField) {
      return IconField.empty().toModel();
    } else if (fieldType == FieldType.idField) {
      return IdField.empty().toModel();
    } else if (fieldType == FieldType.modelsSelectorField) {
      return ModelsSelectorField.empty().toModel();
    } else if (fieldType == FieldType.stringField) {
      return StringField.empty().toModel();
    } else if (fieldType == FieldType.multiSelectorField) {
      return MultiSelectorField.empty().toModel();
    } else if (fieldType == FieldType.numberField) {
      return NumberField.empty().toModel();
    } else if (fieldType == FieldType.queryFilterField) {
      return QueryFilterField.empty().toModel();
    } else if (fieldType == FieldType.queryFilterValueField) {
      return QueryFilterValueField.empty().toModel();
    } else if (fieldType == FieldType.screenField) {
      return ScreenField.empty().toModel();
    } else if (fieldType == FieldType.selectorField) {
      return SelectorField.empty().toModel();
    } else if (fieldType == FieldType.structureField) {
      return StructureField.empty().toModel();
    } else if (fieldType == FieldType.structuredField) {
      return StructuredField.empty().toModel();
    } else if (fieldType == FieldType.dynamicField) {
      return DynamicField.empty().toModel();
    }
    // TODO(alphamikle): [FIELDS] Add new fields here
    throw Exception('Unknown field type: $fieldType');
  }

  static T fieldTypeToField<T extends Field>(FieldType fieldType) {
    if (fieldType == FieldType.binaryField) {
      return BinaryField.empty() as T;
    } else if (fieldType == FieldType.boolField) {
      return BoolField.empty() as T;
    } else if (fieldType == FieldType.colorField) {
      return ColorField.empty() as T;
    } else if (fieldType == FieldType.dateField) {
      return DateTimeField.empty() as T;
    } else if (fieldType == FieldType.enumField) {
      return EnumField.empty() as T;
    } else if (fieldType == FieldType.fontField) {
      return FontField.empty() as T;
    } else if (fieldType == FieldType.headerField) {
      return HeaderField.empty() as T;
    } else if (fieldType == FieldType.iconField) {
      return IconField.empty() as T;
    } else if (fieldType == FieldType.idField) {
      return IdField.empty() as T;
    } else if (fieldType == FieldType.modelsSelectorField) {
      return ModelsSelectorField.empty() as T;
    } else if (fieldType == FieldType.stringField) {
      return StringField.empty() as T;
    } else if (fieldType == FieldType.multiSelectorField) {
      return MultiSelectorField.empty() as T;
    } else if (fieldType == FieldType.numberField) {
      return NumberField.empty() as T;
    } else if (fieldType == FieldType.queryFilterField) {
      return QueryFilterField.empty() as T;
    } else if (fieldType == FieldType.queryFilterValueField) {
      return QueryFilterValueField.empty() as T;
    } else if (fieldType == FieldType.screenField) {
      return ScreenField.empty() as T;
    } else if (fieldType == FieldType.selectorField) {
      return SelectorField.empty() as T;
    } else if (fieldType == FieldType.structureField) {
      return StructureField.empty() as T;
    } else if (fieldType == FieldType.structuredField) {
      return StructuredField.empty() as T;
    } else if (fieldType == FieldType.dynamicField) {
      return DynamicField.empty() as T;
    }
    // TODO(alphamikle): [FIELDS] Add new fields here
    throw Exception('Unknown field type: $fieldType');
  }

  // ! This fields is for public using
  static List<Field> get customerFields {
    return [
      IdField.empty(),
      StringField.empty(),
      NumberField.empty(),
      DateTimeField.empty(),
      BoolField.empty(),
      ColorField.empty(),
      HeaderField.empty(),
      IconField.empty(),
      SelectorField.empty(),
      EnumField.empty(),
      FontField.empty(),
      MultiSelectorField.empty(),
      DynamicField.empty(),
      StructuredField.empty(),
      ScreenField.empty(),

      /// ? THIS FIELD IS FOR PRIVATE USE ONLY
      // BinaryField.empty(),
      // ModelsSelectorField.empty(),
      // StructureField.empty(),
      // QueryFilterField.empty(),
      // QueryFilterValueField.empty(),
      // TODO(alphamikle): [FIELDS] Add new fields here
    ];
  }
}
