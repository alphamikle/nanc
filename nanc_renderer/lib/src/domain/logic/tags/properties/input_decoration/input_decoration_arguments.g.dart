// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_decoration_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InputDecorationArguments _$InputDecorationArgumentsFromJson(
        Map<String, dynamic> json) =>
    InputDecorationArguments(
      fillColor: nullableColorFromJson(json['fillColor'] as String?),
      alignLabelWithHint: nullableBoolFromJson(json['alignLabelWithHint']),
      counterText: json['counterText'] as String?,
      enabled: nullableBoolFromJson(json['enabled']),
      errorMaxLines: nullableIntFromJson(json['errorMaxLines']),
      errorText: json['errorText'] as String?,
      filled: nullableBoolFromJson(json['filled']),
      focusColor: nullableColorFromJson(json['focusColor'] as String?),
      helperMaxLines: nullableIntFromJson(json['helperMaxLines']),
      helper: json['helper'] as String?,
      hintMaxLines: nullableIntFromJson(json['hintMaxLines']),
      hint: json['hint'] as String?,
      hintTextDirection: $enumDecodeNullable(
          _$TextDirectionEnumMap, json['hintTextDirection'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      hoverColor: nullableColorFromJson(json['hoverColor'] as String?),
      iconColor: nullableColorFromJson(json['iconColor'] as String?),
      collapsed: nullableBoolFromJson(json['collapsed']),
      dense: nullableBoolFromJson(json['dense']),
      label: json['label'] as String?,
      prefixIconColor:
          nullableColorFromJson(json['prefixIconColor'] as String?),
      prefixText: json['prefixText'] as String?,
      semanticCounterText: json['semanticCounterText'] as String?,
      suffixIconColor:
          nullableColorFromJson(json['suffixIconColor'] as String?),
      suffixText: json['suffixText'] as String?,
      simpleBorders: nullableBoolFromJson(json['simpleBorders']),
    );

Map<String, dynamic> _$InputDecorationArgumentsToJson(
        InputDecorationArguments instance) =>
    <String, dynamic>{
      'fillColor': colorToJson(instance.fillColor),
      'alignLabelWithHint': instance.alignLabelWithHint,
      'counterText': instance.counterText,
      'enabled': instance.enabled,
      'errorMaxLines': instance.errorMaxLines,
      'errorText': instance.errorText,
      'filled': instance.filled,
      'focusColor': colorToJson(instance.focusColor),
      'helperMaxLines': instance.helperMaxLines,
      'helper': instance.helper,
      'hintMaxLines': instance.hintMaxLines,
      'hint': instance.hint,
      'hintTextDirection': _$TextDirectionEnumMap[instance.hintTextDirection],
      'hoverColor': colorToJson(instance.hoverColor),
      'iconColor': colorToJson(instance.iconColor),
      'collapsed': instance.collapsed,
      'dense': instance.dense,
      'label': instance.label,
      'prefixIconColor': colorToJson(instance.prefixIconColor),
      'prefixText': instance.prefixText,
      'semanticCounterText': instance.semanticCounterText,
      'suffixIconColor': colorToJson(instance.suffixIconColor),
      'suffixText': instance.suffixText,
      'simpleBorders': instance.simpleBorders,
    };

const _$TextDirectionEnumMap = {
  TextDirection.rtl: 'rtl',
  TextDirection.ltr: 'ltr',
};
