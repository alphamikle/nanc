import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../../model/logic/model/logic/model.dart';
import '../../type/field_types.dart';
import '../field/field.dart';
import '../field/field_description.dart';
import '../field/field_props.dart';

part 'dynamic_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class DynamicField extends Field {
  DynamicField({
    required super.name,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.validator,
    this.contentIcon,
    this.contentColor,
    super.type = FieldType.dynamicField,
  }) : super(id: id ?? toSnakeCase(name));

  factory DynamicField.empty() => DynamicField(id: '', name: '');

  factory DynamicField.fromJson(dynamic json) => _$DynamicFieldFromJson(castToJson(json));

  final String? contentIcon;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? contentColor;

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.mdi_playlist_edit,
      color: Color.fromRGBO(245, 163, 98, 1),
      title: 'Dynamic field',
      description: 'A field with the ability to specify any data format of any nesting depth. You can describe any structure with this field',
    );
  }

  @override
  Json toJson() => _$DynamicFieldToJson(this);

  @override
  Model toModel() {
    return Model(
      name: description().title,
      icon: IconPackNames.mdi_playlist_edit,
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
        [
          fieldToModelContentColor,
          fieldToModelContentIcon,
        ],
      ],
    );
  }

  @override
  List<Object?> get props => [...super.props, ..._$props];

  @override
  bool get isEmpty => this == DynamicField.empty();
}
