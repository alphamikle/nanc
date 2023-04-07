import 'package:autoequal/autoequal.dart';
import 'package:config/config.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../type/field_types.dart';
import '../field/field.dart';
import '../field/field_description.dart';
import '../field/field_props.dart';

part 'string_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class StringField extends Field {
  StringField({
    required super.name,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.width,
    super.validator,
    this.maxLines,
    super.type = FieldType.stringField,
  }) : super(id: id ?? toSnackCase(name));

  factory StringField.empty() => StringField(id: '', name: '');

  factory StringField.fromJson(dynamic json) => _$StringFieldFromJson(castToJson(json));

  final int? maxLines;

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.mdi_form_textbox,
      color: Color.fromRGBO(149, 112, 77, 1),
      title: 'String field',
      description: 'A field for entering lines with the ability to specify a fixed height of the field itself or make the height dynamic',
    );
  }

  @override
  Json toJson() => _$StringFieldToJson(this);

  @override
  Model toModel() {
    final Model entity = super.toModel();
    return entity.copyWith(
      fields: [
        [
          fieldToModelName,
          fieldToModelId,
        ],
        [
          fieldToModelMaxLines,
          fieldToModelSort,
          fieldToModelWidth,
        ],
        [
          fieldToModelShowInList,
          fieldToModelIsRequired,
        ],
        [
          // TODO(alphamikle): Make code field
          if (Env.isRealCMS) fieldToModelValidator,
        ]
      ],
    );
  }

  @override
  List<Object?> get props => _$props;

  @override
  bool get isEmpty => this == StringField.empty();
}
