import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:fields/fields.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'model.g.dart';

bool _codeFirstFlagFromJson(dynamic value) => false;

bool _codeFirstFlagToJson(dynamic value) => false;

/// [Model] is a representation of some domain object, which we want to have shown at the admin panel
@CopyWith()
@JsonSerializable()
class Model extends Equatable {
  Model({
    required this.name,
    required this.icon,
    required this.fields,
    this.isCollection = true,
    this.sort = 0,
    this.showInMenu = true,
    String? id,
    this.codeFirstEntity = true,
  }) : id = id ?? toSnackCase(name) {
    /// ? FLATTEN FIELDS
    flattenFields = fields.fold(<Field>[], (List<Field> previousValue, List<Field> element) => previousValue..addAll(element));

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

  factory Model.emptySolo() => Model(
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

  final String id;
  final String name;
  final String icon;
  final bool isCollection;
  final int sort;
  final bool showInMenu;

  @JsonKey(fromJson: fieldsFromJson, toJson: fieldsToJson)
  final List<List<Field>> fields;

  /// This field will always being [true] if model is created from the code
  /// and always being [false] if it is a dynamic model, created via admin panel
  /// ans stored on the backend side
  @JsonKey(fromJson: _codeFirstFlagFromJson, toJson: _codeFirstFlagToJson, defaultValue: false)
  final bool codeFirstEntity;

  @JsonKey(ignore: true)
  late final List<Field> flattenFields;

  @JsonKey(ignore: true)
  late final List<Field> listFields;

  @JsonKey(ignore: true)
  late final IdField idField;

  @JsonKey(ignore: true)
  late final List<String> dynamicFields;

  Field? fieldById(String fieldId) {
    final List<Field> fields = flattenFields;
    for (final Field field in fields) {
      if (field.id == fieldId) {
        return field;
      }
    }
    return null;
  }

  Json createEmptyData() {
    final Json result = <String, dynamic>{};
    for (final Field field in flattenFields) {
      result[field.id] = null;
    }
    return result;
  }

  Json toJson() => _$ModelToJson(this);

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
  List<Object?> get props => [
        id,
        name,
        icon,
        isCollection,
        sort,
        showInMenu,
        fields,
        codeFirstEntity,
      ];
}
