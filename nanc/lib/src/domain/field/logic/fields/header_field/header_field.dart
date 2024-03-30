import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:tools/tools.dart';

import '../../../../model/logic/model/logic/model.dart';
import '../../type/field_types.dart';
import '../bool_field/bool_field.dart';
import '../field/field.dart';
import '../field/field_description.dart';
import '../field/field_props.dart';
import '../number_field/number_field.dart';

part 'header_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class HeaderField extends Field {
  HeaderField({
    required super.name,
    String? content,
    this.contentColor,
    this.contentIcon,
    this.contentFontSize,
    this.useAsDivider = false,
    String? id,
    super.type = FieldType.headerField,
  })  : content = content ?? name,
        super(id: id ?? '${toSnakeCase(name)}_header', showInList: false, realField: false);

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
      color: Color.fromRGBO(123, 9, 5, 1),
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
      icon: IconPackNames.mdi_format_header_pound,
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
  List<Object?> get props => [...super.props, ..._$props];

  @override
  bool get isEmpty => this == HeaderField.empty();
}
