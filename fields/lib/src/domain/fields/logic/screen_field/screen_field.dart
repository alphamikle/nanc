import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../../../fields.dart';

part 'screen_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class ScreenField extends Field {
  ScreenField({
    required super.name,
    required this.screenContentType,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.width,
    super.validator,
    super.type = FieldType.screenField,
  }) : super(id: id ?? toSnakeCase(name));

  factory ScreenField.empty() => ScreenField(id: '', name: '', screenContentType: ScreenContentType.scrollable);

  factory ScreenField.fromJson(dynamic json) => _$ScreenFieldFromJson(castToJson(json));

  final ScreenContentType screenContentType;

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
        ],
        [
          fieldToModelSort,
          fieldToModelWidth,
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
