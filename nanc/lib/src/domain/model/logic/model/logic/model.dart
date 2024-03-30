import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:tools/tools.dart';

import '../../../../field/logic/fields/dynamic_field/dynamic_field.dart';
import '../../../../field/logic/fields/field/field.dart';
import '../../../../field/logic/fields/id_field/id_field.dart';
import '../../../../field/logic/fields/structure_field/structure_field.dart';
import '../../../../field/logic/fields/structured_field/structured_field.dart';
import '../../../../field/logic/mapper/field_mapper.dart';
import '../../../../field/logic/tools/json_factories.dart';

part 'model.g.dart';

bool _codeFirstFlagFromJson(dynamic value) => false;

bool _codeFirstFlagToJson(dynamic value) => false;

/// [Model] is a representation of some domain object, which we want to have shown at the admin panel
@autoequal
@CopyWith()
@JsonSerializable()
class Model extends Equatable implements IModel {
  Model({
    required this.name,
    required this.icon,
    required this.fields,
    this.isCollection = true,
    this.sort = 0,
    this.showInMenu = true,
    String? id,
    this.codeFirstEntity = true,
    this.isHybrid = false,
  }) : id = id ?? toSnakeCase(name) {
    /// ? FLATTEN FIELDS
    flattenFields = fields.fold(<Field>[], (List<Field> allFields, List<Field> currentRowFields) {
      for (final Field field in currentRowFields) {
        allFields.add(field);
        if (field.virtualFields.isNotEmpty) {
          allFields.addAll(field.virtualFields);
        }
      }
      return allFields;
    });

    /// ? LIST FIELDS
    final List<Field> listFieldsTemp = flattenFields.where((Field field) => field.showInList).toList();
    listFieldsTemp.sort((first, second) => first.sort.compareTo(second.sort));
    listFields = listFieldsTemp;

    /// ? ID FIELD
    final List<IdField> idFieldsTemp = flattenFields.whereType<IdField>().toList();
    assert(idFieldsTemp.isNotEmpty, 'You should specify at least a one $IdField at your model $runtimeType');
    idField = idFieldsTemp.first;

    /// ? DYNAMIC FIELDS IDS
    final List<String> dynamicFieldsTemp = [];
    for (final Field field in flattenFields) {
      if (field is DynamicField && field is! StructuredField && field is! StructureField) {
        dynamicFieldsTemp.add(field.id);
      }
    }
    dynamicFields = dynamicFieldsTemp;
  }

  factory Model.initialSolo() => Model(
        name: '',
        icon: '',
        fields: [
          [
            IdField(),
          ]
        ],
        isCollection: false,
      );

  factory Model.empty() => Model(
        name: '',
        icon: '',
        fields: [
          [
            IdField(id: '', name: ''),
          ]
        ],
      );

  factory Model.initialCollection() => Model(
        name: '',
        icon: '',
        fields: [
          [
            IdField(),
          ]
        ],
      );

  factory Model.fromJson(dynamic json) => _$ModelFromJson(castToJson(json));

  static String idPropertyName = 'id';
  static String namePropertyName = 'name';
  static String iconPropertyName = 'icon';
  static String isCollectionPropertyName = 'isCollection';
  static String sortPropertyName = 'sort';
  static String showInMenuPropertyName = 'showInMenu';

  @override
  final String id;

  @override
  final String name;

  @override
  final String icon;

  @override
  final bool isCollection;

  @override
  final int sort;

  @override
  final bool showInMenu;

  @override
  @JsonKey(fromJson: fieldsFromJson, toJson: fieldsToJson)
  final List<List<Field>> fields;

  /// This field will always being [true] if model is created from the code
  /// and always being [false] if it is a dynamic model, created via admin panel
  /// ans stored on the backend side
  @override
  @JsonKey(fromJson: _codeFirstFlagFromJson, toJson: _codeFirstFlagToJson, defaultValue: false)
  final bool codeFirstEntity;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool isHybrid;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  late final List<Field> flattenFields;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  late final List<Field> listFields;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  late final IdField idField;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  late final List<String> dynamicFields;

  @override
  Field? fieldById(String fieldId) {
    final List<Field> fields = flattenFields;
    for (final Field field in fields) {
      if (field.id == fieldId) {
        return field;
      }
    }
    return null;
  }

  @override
  Json createEmptyData() {
    final Json result = <String, dynamic>{};
    for (final Field field in flattenFields) {
      result[field.id] = null;
    }
    return result;
  }

  @override
  Json toJson() => _$ModelToJson(this);

  @override
  Model deepClone() {
    final List<List<Field>> fields = [];
    for (int i = 0; i < this.fields.length; i++) {
      if (fields.length <= i) {
        fields.add([]);
      }
      for (int k = 0; k < this.fields[i].length; k++) {
        final Field field = this.fields[i][k];
        fields[i].add(FieldMapper.deepClone(field));
      }
    }
    return copyWith(fields: fields);
  }

  @override
  List<Object?> get props => _$props;
}

extension FieldsIds on List<Field> {
  List<String> get ids {
    return map((Field field) => field.id).toList();
  }

  List<String> get realIds {
    return realFields.map((Field field) => field.id).toList();
  }

  List<Field> get realFields {
    return where((Field field) => field.realField).toList();
  }
}
