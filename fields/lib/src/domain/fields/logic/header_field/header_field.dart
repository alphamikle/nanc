import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:fields/fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

part 'header_field.g.dart';

@CopyWith()
@JsonSerializable()
class HeaderField extends Field {
  HeaderField({
    required super.name,
    required this.content,
    this.contentColor,
    this.contentIcon,
    this.contentFontSize,
    this.useAsDivider = false,
    String? id,
    super.type = FieldType.headerField,
  }) : super(id: id ?? toSnackCase(name), showInList: false, editableField: false);

  factory HeaderField.empty() => HeaderField(id: '', name: '', content: '');

  factory HeaderField.fromJson(dynamic json) => _$HeaderFieldFromJson(castToJson(json));

  final String content;

  final String? contentIcon;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? contentColor;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? contentFontSize;

  final bool useAsDivider;

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.mdi_format_header_pound,
      color: Color.fromRGBO(22, 0, 30, 1),
      title: 'Fields header',
      description: 'Not a real field, but a header for the convenient work with model',
    );
  }

  @override
  Json toJson() => _$HeaderFieldToJson(this);

  @override
  Model toModel() {
    return Model(
      name: description().title,
      icon: 'mdi_format_header_pound',
      fields: [
        [
          fieldToModelName,
          fieldToModelId,
        ],
        [
          fieldToModelContent,
        ],
        [
          fieldToModelContentColor,
          fieldToModelContentIcon,
          NumberField(id: 'contentFontSize', name: 'Font size'),
          BoolField(id: 'useAsDivider', name: 'Use as divider'),
        ],
      ],
    );
  }

  @override
  bool get isEmpty => this == HeaderField.empty();
}
