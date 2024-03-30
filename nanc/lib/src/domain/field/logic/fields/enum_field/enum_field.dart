import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:tools/tools.dart';

import '../../../../model/logic/model/logic/model.dart';
import '../../type/field_types.dart';
import '../field/field.dart';
import '../field/field_description.dart';
import '../field/field_props.dart';
import '../string_field/string_field.dart';
import '../structured_field/structured_field.dart';
import 'enum_value.dart';

part 'enum_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class EnumField extends Field {
  EnumField({
    required super.name,
    required this.values,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.validator,
    super.type = FieldType.enumField,
  }) : super(id: id ?? toSnakeCase(name));

  factory EnumField.empty() => EnumField(id: '', name: '', values: const []);

  factory EnumField.fromJson(dynamic json) => _$EnumFieldFromJson(castToJson(json));

  final List<EnumValue> values;

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.mdi_format_list_bulleted_square,
      color: Color.fromRGBO(231, 112, 82, 1),
      title: 'Enum field',
      description:
          'A field for selecting one option from several values. It is assumed that these values will not be too many. If you feel that this field is getting uncomfortable, take a look at Selector Field',
    );
  }

  @override
  List<Object?> get props => [...super.props, ..._$props];

  @override
  Json toJson() => _$EnumFieldToJson(this);

  @override
  Model toModel() {
    return Model(
      name: description().title,
      icon: IconPackNames.mdi_format_list_bulleted_square,
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
          StructuredField(
            id: 'values',
            name: 'Enum values',
            structure: [
              StringField(id: 'title', name: 'Title'),
              StringField(id: 'value', name: 'Value'),
            ],
          ),
        ],
      ],
    );
  }

  @override
  bool get isEmpty => this == EnumField.empty();
}
