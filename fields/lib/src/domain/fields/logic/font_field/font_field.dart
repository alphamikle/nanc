import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../../../type/field_types.dart';
import '../field/field.dart';
import '../field/field_description.dart';

part 'font_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class FontField extends Field {
  FontField({
    required super.name,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.width,
    super.validator,
    super.type = FieldType.fontField,
  }) : super(id: id ?? toSnackCase(name));

  factory FontField.empty() => FontField(id: '', name: '');

  factory FontField.fromJson(dynamic json) => _$FontFieldFromJson(castToJson(json));

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.mdi_format_font,
      color: Color.fromRGBO(58, 96, 100, 1),
      title: 'Font field',
      description: 'Field, which able you to choose any of available fonts (Google Fonts or your custom)',
    );
  }

  @override
  Json toJson() => _$FontFieldToJson(this);

  @override
  List<Object?> get props => _$props;

  @override
  bool get isEmpty => this == FontField.empty();
}
