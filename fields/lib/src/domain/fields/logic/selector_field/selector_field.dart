import 'package:autoequal/autoequal.dart';
import 'package:config/config.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../type/field_types.dart';
import '../field/field.dart';
import '../field/field_description.dart';
import '../field/field_props.dart';
import '../id_field/id_field.dart';
import '../string_field/string_field.dart';
import 'title_fields.dart';

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

@autoequal
@CopyWith()
@JsonSerializable()
class SelectorField extends Field {
  SelectorField({
    required super.name,
    required this.model,
    required this.titleFields,
    String? virtualField,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.width,
    super.validator,
    super.type = FieldType.selectorField,
  })  : virtualField = virtualField ?? '\$${id ?? toSnackCase(name)}',
        super(id: id ?? toSnackCase(name));

  factory SelectorField.empty() => SelectorField(
        id: '',
        name: '',
        model: IdField.empty().toModel(),
        titleFields: const [],
      );

  factory SelectorField.fromJson(dynamic json) => _$SelectorFieldFromJson(castToJson(json));

  final String virtualField;

  @JsonKey(fromJson: _entityFromJson, toJson: _entityToJson)
  final Model model;

  @JsonKey(fromJson: titleFieldsFromJson, toJson: titleFieldsToJson)
  final List<TitleField> titleFields;

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.mdi_order_bool_descending,
      color: Color.fromRGBO(255, 42, 13, 1),
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
          fieldToModelVirtualField,
        ],
        [
          // TODO(alphamikle): Новое поле "OtherModelField" - которое показывает выбор из других моделей
          StringField(id: fieldModelProperty, name: 'Model'),
          // TODO(alphamikle): Новое поле "OtherModelFieldsField" - которое показывает список полей из выбранной модели и выбирать мы можем их или другие [TitleField]s
          StringField(id: fieldTitleFieldProperty, name: 'Name of field with title from the child object'),
          // TODO(alphamikle): Упразднится
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
  List<Object?> get props => [...super.props, ..._$props];

  @override
  bool get isEmpty => this == SelectorField.empty();
}
