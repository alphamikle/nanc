import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:fields/src/domain/fields/logic/field/field.dart';
import 'package:fields/src/domain/fields/logic/field/field_description.dart';
import 'package:fields/src/domain/type/field_types.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'color_field.g.dart';

@CopyWith()
@JsonSerializable()
class ColorField extends Field {
  ColorField({
    required super.name,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.width,
    super.validator,
    super.type = FieldType.colorField,
  }) : super(id: id ?? toSnackCase(name));

  factory ColorField.empty() => ColorField(id: '', name: '');

  factory ColorField.fromJson(dynamic json) => _$ColorFieldFromJson(castToJson(json));

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: MdiIcons.palette,
      color: Color.fromRGBO(242, 100, 25, 1),
      title: 'Color field',
      description: 'Color picker field with an option to use the color picker or set the color from HEX',
    );
  }

  @override
  Json toJson() => _$ColorFieldToJson(this);

  @override
  bool get isEmpty => this == ColorField.empty();
}
