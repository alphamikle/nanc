// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button_style_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ButtonStyleArguments _$ButtonStyleArgumentsFromJson(
        Map<String, dynamic> json) =>
    ButtonStyleArguments(
      iconSize: nullableDoubleFromJson(json['iconSize'] as String?),
      align: $enumDecodeNullable(_$AlignmentEnumEnumMap, json['align'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      elevation: nullableDoubleFromJson(json['elevation'] as String?),
      iconColor: nullableColorFromJson(json['iconColor'] as String?),
      shadowColor: nullableColorFromJson(json['shadowColor'] as String?),
      backgroundColor:
          nullableColorFromJson(json['backgroundColor'] as String?),
      foregroundColor:
          nullableColorFromJson(json['foregroundColor'] as String?),
      overlayColor: nullableColorFromJson(json['overlayColor'] as String?),
      surfaceTintColor:
          nullableColorFromJson(json['surfaceTintColor'] as String?),
    );

Map<String, dynamic> _$ButtonStyleArgumentsToJson(
        ButtonStyleArguments instance) =>
    <String, dynamic>{
      'iconSize': instance.iconSize,
      'align': _$AlignmentEnumEnumMap[instance.align],
      'elevation': instance.elevation,
      'iconColor': colorToJson(instance.iconColor),
      'shadowColor': colorToJson(instance.shadowColor),
      'backgroundColor': colorToJson(instance.backgroundColor),
      'foregroundColor': colorToJson(instance.foregroundColor),
      'overlayColor': colorToJson(instance.overlayColor),
      'surfaceTintColor': colorToJson(instance.surfaceTintColor),
    };

const _$AlignmentEnumEnumMap = {
  AlignmentEnum.topLeft: 'topLeft',
  AlignmentEnum.topCenter: 'topCenter',
  AlignmentEnum.topRight: 'topRight',
  AlignmentEnum.centerLeft: 'centerLeft',
  AlignmentEnum.center: 'center',
  AlignmentEnum.centerRight: 'centerRight',
  AlignmentEnum.bottomLeft: 'bottomLeft',
  AlignmentEnum.bottomCenter: 'bottomCenter',
  AlignmentEnum.bottomRight: 'bottomRight',
};
