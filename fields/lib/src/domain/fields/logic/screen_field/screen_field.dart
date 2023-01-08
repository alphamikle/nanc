import 'package:config/config.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:fields/src/domain/fields/logic/bool_field/bool_field.dart';
import 'package:fields/src/domain/fields/logic/field/field.dart';
import 'package:fields/src/domain/fields/logic/field/field_description.dart';
import 'package:fields/src/domain/fields/logic/field/field_props.dart';
import 'package:fields/src/domain/type/field_types.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

part 'screen_field.g.dart';

@CopyWith()
@JsonSerializable()
class ScreenField extends Field {
  ScreenField({
    required super.name,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.width,
    super.validator,
    this.isScrollable = true,
    super.type = FieldType.screenField,
  }) : super(id: id ?? toSnackCase(name));

  factory ScreenField.empty() => ScreenField(id: '', name: '');

  factory ScreenField.fromJson(dynamic json) => _$ScreenFieldFromJson(castToJson(json));

  final bool isScrollable;

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.flu_phone_vertical_scroll_filled,
      color: Color.fromRGBO(147, 225, 216, 1),
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
        ],
        [
          fieldToModelShowInList,
          fieldToModelIsRequired,
          if (Env.isRealCMS) BoolField(id: fieldIsScrollableProperty, name: 'Will this screen be a simple scrollable view?', defaultValue: true),
        ],
        [
          // TODO(alphamikle): Make code field
          if (Env.isRealCMS) fieldToModelValidator,
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
  List<Object?> get props => [
        ...super.props,
        isScrollable,
      ];

  @override
  bool get isEmpty => this == ScreenField.empty();
}
