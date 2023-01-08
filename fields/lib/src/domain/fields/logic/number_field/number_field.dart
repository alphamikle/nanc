import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:fields/fields.dart';
import 'package:fields/src/domain/fields/logic/field/field_description.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'number_field.g.dart';

@CopyWith()
@JsonSerializable()
class NumberField extends Field {
  NumberField({
    required super.name,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.width,
    super.validator,
    super.type = FieldType.numberField,
  }) : super(id: id ?? toSnackCase(name));

  factory NumberField.empty() => NumberField(id: '', name: '');

  factory NumberField.fromJson(dynamic json) => _$NumberFieldFromJson(castToJson(json));

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.mdi_numeric,
      color: Color.fromRGBO(231, 107, 116, 1),
      title: 'Number field',
      description: 'Field for entering numbers',
    );
  }

  @override
  Json toJson() => _$NumberFieldToJson(this);

  @override
  bool get isEmpty => this == NumberField.empty();
}
