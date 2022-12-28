import 'package:config/config.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:fields/src/domain/fields/logic/field/field.dart';
import 'package:fields/src/domain/fields/logic/field/field_description.dart';
import 'package:fields/src/domain/fields/logic/field/field_props.dart';
import 'package:fields/src/domain/fields/logic/id_field/id_field.dart';
import 'package:fields/src/domain/fields/logic/string_field/string_field.dart';
import 'package:fields/src/domain/type/field_types.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

part 'selector_field.g.dart';

Model _entityFromJson(dynamic value) {
  if (value is Map) {
    final Json json = <String, dynamic>{};
    for (final entry in value.entries) {
      json[entry.key.toString()] = entry.value;
    }
    return Model.fromJson(json);
  }
  throw Exception('Incorrect type of Entity Json representation');
}

Json _entityToJson(Model entity) => entity.toJson();

enum SelectorFieldStructure {
  id,
  object,
}

@CopyWith()
@JsonSerializable()
class SelectorField extends Field {
  SelectorField({
    required super.name,
    required this.model,
    required this.titleField,
    required this.structure,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.width,
    super.validator,
    super.type = FieldType.selectorField,
  }) : super(id: id ?? toSnackCase(name));

  factory SelectorField.empty() => SelectorField(
        id: '',
        name: '',
        model: IdField.empty().toModel(),
        titleField: '',
        structure: SelectorFieldStructure.id,
      );

  factory SelectorField.fromJson(dynamic json) => _$SelectorFieldFromJson(castToJson(json));

  @JsonKey(fromJson: _entityFromJson, toJson: _entityToJson)
  final Model model;
  final String titleField;
  final SelectorFieldStructure structure;

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: MdiIcons.orderBoolDescending,
      color: Color.fromRGBO(201, 133, 134, 1),
      title: 'Selector field',
      description: 'A field that allows you to select a value from a linked model. It is the analog of the SQL "one-to-many" relation',
    );
  }

  @override
  Json toJson() => _$SelectorFieldToJson(this);

  @override
  Model toModel() {
    final Model entity = super.toModel();
    return entity.copyWith(
      fields: [
        [
          fieldToModelName,
          fieldToModelId,
        ],
        [
          // TODO(alphamikle): Structure field
          StringField(id: fieldModelProperty, name: 'Model'),
          StringField(id: fieldTitleFieldProperty, name: 'Name of field with title from the child object'),
          // TODO(alphamikle): Enum field
          StringField(id: fieldStructureProperty, name: 'Type of structure'),
        ],
        [
          fieldToModelSort,
          fieldToModelWidth,
        ],
        [
          fieldToModelShowInList,
          fieldToModelIsRequired,
        ],
        [
          // TODO(alphamikle): Make code field
          if (Env.isRealCMS) fieldToModelValidator,
        ],
      ],
    );
  }

  @override
  List<Object?> get props => [
        ...super.props,
        model,
        titleField,
        structure,
      ];

  @override
  bool get isEmpty => this == SelectorField.empty();
}
