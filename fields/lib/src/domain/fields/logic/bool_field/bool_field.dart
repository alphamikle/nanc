import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

part 'bool_field.g.dart';

@CopyWith()
@JsonSerializable()
class BoolField extends Field {
  BoolField({
    required super.name,
    String? id,
    this.defaultValue = false,
    super.isRequired,
    super.showInList,
    super.sort,
    super.width,
    super.validator,
    super.type = FieldType.boolField,
  }) : super(id: id ?? toSnackCase(name));

  factory BoolField.empty() => BoolField(id: '', name: '');

  factory BoolField.fromJson(dynamic json) => _$BoolFieldFromJson(castToJson(json));

  final bool defaultValue;

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.flu_toggle_left_regular,
      color: Color.fromRGBO(64, 132, 243, 1),
      title: 'Boolean field',
      description: 'A primitive bool type field, with the possibility of setting a default value',
    );
  }

  @override
  Json toJson() => _$BoolFieldToJson(this);

  @override
  Model toModel() {
    return Model(
      name: 'Field $name',
      icon: 'key',
      fields: [
        [
          fieldToModelName,
          fieldToModelId,
        ],
        [
          fieldToModelSort,
          fieldToModelWidth,
        ],
        [
          fieldToModelShowInList,
          fieldToModelDefaultValue,
        ],
      ],
    );
  }

  @override
  Set<String> get defaultValues => {
        ...super.defaultValues,
        'defaultValue',
      };

  @override
  List<Object?> get props => [
        id,
        sort,
        name,
        showInList,
        isRequired,
        width,
        validator,
        type,
        defaultValue,
      ];

  @override
  bool get isEmpty => this == BoolField.empty();
}
