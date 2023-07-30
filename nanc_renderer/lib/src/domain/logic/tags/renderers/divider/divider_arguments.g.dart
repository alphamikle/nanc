// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'divider_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DividerArguments _$DividerArgumentsFromJson(Map<String, dynamic> json) =>
    DividerArguments(
      height: nullableDoubleFromJson(json['height']),
      color: nullableColorFromJson(json['color'] as String?),
      indent: nullableDoubleFromJson(json['indent']),
      endIndent: nullableDoubleFromJson(json['endIndent']),
      thickness: nullableDoubleFromJson(json['thickness']),
    );

Map<String, dynamic> _$DividerArgumentsToJson(DividerArguments instance) =>
    <String, dynamic>{
      'height': instance.height,
      'color': colorToJson(instance.color),
      'indent': instance.indent,
      'endIndent': instance.endIndent,
      'thickness': instance.thickness,
    };
