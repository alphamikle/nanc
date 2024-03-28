import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../../../../model/logic/model/logic/model.dart';
import '../../type/field_types.dart';
import '../field/field.dart';
import '../field/field_description.dart';
import '../field/field_props.dart';

part 'color_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class ColorField extends Field {
  ColorField({
    required super.name,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.validator,
    super.type = FieldType.colorField,
  }) : super(id: id ?? toSnakeCase(name));

  factory ColorField.empty() => ColorField(id: '', name: '');

  factory ColorField.fromJson(dynamic json) => _$ColorFieldFromJson(castToJson(json));

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.mdi_palette_advanced,
      color: Color.fromRGBO(38, 70, 83, 1),
      title: 'Color field',
      description: 'Color picker field with an option to use the color picker or set the color from HEX',
    );
  }

  @override
  Json toJson() => _$ColorFieldToJson(this);

  @override
  Model toModel() {
    return Model(
      name: description().title,
      icon: IconPackNames.mdi_palette_advanced,
      fields: [
        [
          fieldToModelName,
          fieldToModelId,
        ],
        [
          fieldToModelSort,
          fieldToModelShowInList,
          fieldToModelIsRequired,
        ],
      ],
    );
  }

  @override
  bool get isEmpty => this == ColorField.empty();

  @override
  List<Object?> get props => [...super.props, ..._$props];
}
