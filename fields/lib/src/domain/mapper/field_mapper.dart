import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../fields.dart';

abstract class FieldMapper {
  static T deepClone<T extends Field>(T field) {
    final FieldType type = field.type;

    if (type == FieldType.boolField) {
      return (field as BoolField).copyWith() as T;
    } else if (type == FieldType.colorField) {
      return (field as ColorField).copyWith() as T;
    } else if (type == FieldType.dateField) {
      return (field as DateField).copyWith() as T;
    } else if (type == FieldType.enumField) {
      return (field as EnumField).copyWith(values: field.values.map((EnumValue value) => value.copyWith()).toList()) as T;
    } else if (type == FieldType.fontField) {
      return (field as FontField).copyWith() as T;
    } else if (type == FieldType.groupField) {
      return (field as GroupField).copyWith(fields: field.fields.map(deepClone).toList()) as T;
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
      final ThirdTable? thirdTable = (field as MultiSelectorField).thirdTable;
      final Model model = field.model;
      return field.copyWith(
        model: model.deepClone(),
        thirdTable: thirdTable == null
            ? null
            : thirdTable.copyWith(
                relationsEntity: thirdTable.relationsEntity.deepClone(),
              ),
      ) as T;
    } else if (type == FieldType.numberField) {
      return (field as NumberField).copyWith() as T;
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
    ValueChanged<List<DynamicFieldItem>>? onChangeChildStructure,
    List<DynamicFieldItem>? initialChildrenData,
    ValueChanged<List<StructuredFieldItem>>? onChildChange,
  }) {
    if (field is BoolField) {
      return BoolFieldCell(field: field, creationMode: creationMode);
    } else if (field is ColorField) {
      return ColorFieldCell(field: field, creationMode: creationMode);
    } else if (field is DateField) {
      return DateFieldCell(field: field, creationMode: creationMode);
    } else if (field is EnumField) {
      return EnumFieldCell(field: field, creationMode: creationMode);
    } else if (field is FontField) {
      return FontFieldCell(field: field, creationMode: creationMode);
    } else if (field is GroupField) {
      return GroupFieldCell(field: field, creationMode: creationMode);
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
      return multiSelectorOrchestrator(field: field, creationMode: creationMode);
    } else if (field is NumberField) {
      return NumberFieldCell(field: field, creationMode: creationMode);
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
    logg(warning, '\n', StackTrace.current.toString());
    return ErrorFieldCell(warning: warning);
  }

  static Json fieldToJson(Field field) {
    final String fieldTypeRepresentation = field.runtimeType.toString();

    if (field is BoolField) {
      return field.toJson();
    } else if (field is ColorField) {
      return field.toJson();
    } else if (field is DateField) {
      return field.toJson();
    } else if (field is EnumField) {
      return field.toJson();
    } else if (field is FontField) {
      return field.toJson();
    } else if (field is GroupField) {
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
    if (type == FieldType.boolField.name) {
      return BoolField.fromJson(json) as T;
    } else if (type == FieldType.colorField.name) {
      return ColorField.fromJson(json) as T;
    } else if (type == FieldType.dateField.name) {
      return DateField.fromJson(json) as T;
    } else if (type == FieldType.enumField.name) {
      return EnumField.fromJson(json) as T;
    } else if (type == FieldType.fontField.name) {
      return FontField.fromJson(json) as T;
    } else if (type == FieldType.groupField.name) {
      return GroupField.fromJson(json) as T;
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
    if (fieldType == FieldType.boolField) {
      return BoolField.empty().toModel();
    } else if (fieldType == FieldType.colorField) {
      return ColorField.empty().toModel();
    } else if (fieldType == FieldType.dateField) {
      return DateField.empty().toModel();
    } else if (fieldType == FieldType.enumField) {
      return EnumField.empty().toModel();
    } else if (fieldType == FieldType.fontField) {
      return FontField.empty().toModel();
    } else if (fieldType == FieldType.groupField) {
      return GroupField.empty().toModel();
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
    if (fieldType == FieldType.boolField) {
      return BoolField.empty() as T;
    } else if (fieldType == FieldType.colorField) {
      return ColorField.empty() as T;
    } else if (fieldType == FieldType.dateField) {
      return DateField.empty() as T;
    } else if (fieldType == FieldType.enumField) {
      return EnumField.empty() as T;
    } else if (fieldType == FieldType.fontField) {
      return FontField.empty() as T;
    } else if (fieldType == FieldType.groupField) {
      return GroupField.empty() as T;
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

  static List<Field> get listOfFields {
    return [
      IdField.empty(),
      StringField.empty(),
      NumberField.empty(),
      DateField.empty(),
      BoolField.empty(),
      ColorField.empty(),
      HeaderField.empty(),
      IconField.empty(),
      SelectorField.empty(),
      EnumField.empty(),
      FontField.empty(),
      // GroupField.empty(),
      MultiSelectorField.empty(),
      DynamicField.empty(),

      /// ? THIS FIELD IS FOR PRIVATE USE ONLY
      // StructureField.empty(),
      StructuredField.empty(),
      ScreenField.empty(),
      ModelsSelectorField.empty(),
      // TODO(alphamikle): [FIELDS] Add new fields here
    ];
  }
}
