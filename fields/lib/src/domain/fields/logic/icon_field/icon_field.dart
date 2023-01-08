import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:fields/src/domain/fields/logic/field/field.dart';
import 'package:fields/src/domain/fields/logic/field/field_description.dart';
import 'package:fields/src/domain/type/field_types.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'icon_field.g.dart';

@CopyWith()
@JsonSerializable()
class IconField extends Field {
  IconField({
    required super.name,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.width,
    super.validator,
    super.type = FieldType.iconField,
  }) : super(id: id ?? toSnackCase(name));

  factory IconField.empty() => IconField(id: '', name: '');

  factory IconField.fromJson(dynamic json) => _$IconFieldFromJson(castToJson(json));

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.rmx_paint_brush_fill,
      color: Color.fromRGBO(44, 66, 81, 1),
      title: 'Icon field',
      description: 'A field for selecting an icon from the provided list with the possibility of expanding and easy search in the modal window',
    );
  }

  @override
  Json toJson() => _$IconFieldToJson(this);

  @override
  bool get isEmpty => this == IconField.empty();
}
