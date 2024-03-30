import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../list_view/list_view_arguments.dart';
import '../rich_text/text_span/text_span_arguments.dart';

part 'text_field_arguments.g.dart';

enum TextInputTypeEnum {
  text,
  multiline,
  number,
  phone,
  datetime,
  email,
  url,
  password,
  name,
  address;

  TextInputType toTextInputType() {
    return switch (this) {
      TextInputTypeEnum.text => TextInputType.text,
      TextInputTypeEnum.multiline => TextInputType.multiline,
      TextInputTypeEnum.number => TextInputType.number,
      TextInputTypeEnum.phone => TextInputType.phone,
      TextInputTypeEnum.datetime => TextInputType.datetime,
      TextInputTypeEnum.email => TextInputType.emailAddress,
      TextInputTypeEnum.url => TextInputType.url,
      TextInputTypeEnum.password => TextInputType.visiblePassword,
      TextInputTypeEnum.name => TextInputType.name,
      TextInputTypeEnum.address => TextInputType.streetAddress,
    };
  }
}

@JsonSerializable()
class TextFieldArguments {
  const TextFieldArguments({
    required this.align,
    required this.maxLines,
    required this.textDirection,
    required this.clip,
    required this.onTap,
    required this.onChanged,
    required this.autocorrect,
    required this.autofocus,
    required this.autovalidateMode,
    required this.canRequestFocus,
    required this.cursorColor,
    required this.cursorHeight,
    required this.cursorOpacityAnimates,
    required this.cursorRadius,
    required this.cursorWidth,
    required this.enabled,
    required this.expands,
    required this.enableSuggestions,
    required this.initialValue,
    required this.keyboardAppearance,
    required this.keyboardType,
    required this.maxLength,
    required this.minLines,
    required this.cursor,
    required this.obscureText,
    required this.obscuringCharacter,
    required this.onEditingComplete,
    required this.onFieldSubmitted,
    required this.onSaved,
    required this.readOnly,
    required this.scribbleEnabled,
    required this.scrollPadding,
    required this.physics,
    required this.showCursor,
    required this.textCapitalization,
    required this.textInputAction,
    required this.onTapOutside,
  });

  factory TextFieldArguments.fromJson(dynamic json) => _$TextFieldArgumentsFromJson(castToJson(json));

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextAlign? align;

  @JsonKey(fromJson: nullableIntFromJson)
  final int? maxLines;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextDirection? textDirection;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final Clip? clip;

  final String? onTap;

  final String? onChanged;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? autocorrect;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? autofocus;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final AutovalidateMode? autovalidateMode;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? canRequestFocus;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? cursorColor;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? cursorHeight;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? cursorOpacityAnimates;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? cursorRadius;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? cursorWidth;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? enabled;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? expands;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? enableSuggestions;

  final String? initialValue;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final Brightness? keyboardAppearance;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextInputTypeEnum? keyboardType;

  @JsonKey(fromJson: nullableIntFromJson)
  final int? maxLength;

  @JsonKey(fromJson: nullableIntFromJson)
  final int? minLines;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final MouseCursorEnum? cursor;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? obscureText;

  final String? obscuringCharacter;

  final String? onEditingComplete;

  final String? onTapOutside;

  final String? onFieldSubmitted;

  final String? onSaved;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? readOnly;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? scribbleEnabled;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? scrollPadding;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final ScrollPhysicsEnum? physics;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? showCursor;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextCapitalization? textCapitalization;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final TextInputAction? textInputAction;

  Json toJson() => _$TextFieldArgumentsToJson(this);
}
