import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_model/nanc_model.dart';
import 'package:tools/tools.dart';

import '../../../type/field_types.dart';
import '../field/field.dart';
import '../field/field_description.dart';
import '../field/field_props.dart';

part 'icon_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class IconField extends Field {
  IconField({
    required super.name,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.validator,
    super.type = FieldType.iconField,
  }) : super(id: id ?? toSnakeCase(name));

  factory IconField.empty() => IconField(id: '', name: '');

  factory IconField.fromJson(dynamic json) => _$IconFieldFromJson(castToJson(json));

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.rmx_paint_brush_fill,
      color: Color.fromRGBO(254, 29, 102, 1),
      title: 'Icon field',
      description: 'A field for selecting an icon from the provided list with the possibility of expanding and easy search in the modal window',
    );
  }

  @override
  Json toJson() => _$IconFieldToJson(this);

  @override
  Model toModel() {
    return Model(
      name: description().title,
      icon: IconPackNames.rmx_paint_brush_fill,
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
  List<Object?> get props => [...super.props, ..._$props];

  @override
  bool get isEmpty => this == IconField.empty();
}
