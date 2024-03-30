import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:tools/tools.dart';

import '../../../../model/logic/model/logic/model.dart';
import '../../type/field_types.dart';
import '../binary_field/binary_field.dart';
import '../enum_field/enum_field.dart';
import '../enum_field/enum_value.dart';
import '../field/field.dart';
import '../field/field_description.dart';
import '../field/field_props.dart';
import '../string_field/string_field.dart';
import 'screen_content_model.dart';

part 'screen_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class ScreenField extends Field {
  ScreenField({
    required super.name,
    required this.screenContentType,
    this.binaryDataFieldId,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.validator,
    super.type = FieldType.screenField,
  }) : super(id: id ?? toSnakeCase(name));

  factory ScreenField.empty() => ScreenField(id: '', name: '', screenContentType: ScreenContentType.scrollable);

  factory ScreenField.fromJson(dynamic json) => _$ScreenFieldFromJson(castToJson(json));

  final ScreenContentType screenContentType;
  final String? binaryDataFieldId;

  @override
  List<Field> get virtualFields {
    return [
      if (binaryDataFieldId != null && binaryDataFieldId!.isNotEmpty)
        BinaryField(
          name: '$name - Binary($binaryDataFieldId)',
          id: binaryDataFieldId,
        ),
    ];
  }

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.flu_phone_vertical_scroll_filled,
      color: Color.fromRGBO(90, 49, 0, 1),
      title: 'Screen field',
      description: 'A field for creating the screen interface of your application. Behind this single field is a world of user interfaces!',
    );
  }

  @override
  Json toJson() => _$ScreenFieldToJson(this);

  @override
  Model toModel() {
    return Model(
      name: 'Field $name',
      icon: 'key',
      fields: [
        [
          fieldToModelName,
          fieldToModelId,
          StringField(name: 'Binary Data Field ID', id: 'binaryDataFieldId', maxLines: 1),
        ],
        [
          fieldToModelSort,
          fieldToModelShowInList,
          fieldToModelIsRequired,
        ],
        [
          EnumField(
            id: 'screenContentType',
            name: 'Screen Type',
            isRequired: true,
            values: [
              EnumValue(title: 'Scrollable', value: ScreenContentType.scrollable.name),
              EnumValue(title: 'Stack', value: ScreenContentType.stack.name),
            ],
          ),
        ],
      ],
    );
  }

  @override
  Set<String> get defaultValues => {
        ...super.defaultValues,
        fieldIsScrollableProperty,
      };

  @override
  List<Object?> get props => [...super.props, ..._$props];

  @override
  bool get isEmpty => this == ScreenField.empty();
}
