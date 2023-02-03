import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

part 'dynamic_field.g.dart';

@CopyWith()
@JsonSerializable()
class DynamicField extends Field {
  DynamicField({
    required super.name,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.width,
    super.validator,
    this.contentIcon,
    this.contentColor,
    super.type = FieldType.dynamicField,
  }) : super(id: id ?? toSnackCase(name));

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
  List<Object?> get props => [
        ...super.props,
        contentIcon,
        contentColor,
      ];

  @override
  bool get isEmpty => this == DynamicField.empty();
}
