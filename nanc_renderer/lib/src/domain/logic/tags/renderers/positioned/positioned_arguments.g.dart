// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'positioned_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PositionedArguments _$PositionedArgumentsFromJson(Map<String, dynamic> json) =>
    PositionedArguments(
      width: nullableDoubleFromJson(json['width'] as String?),
      height: nullableDoubleFromJson(json['height'] as String?),
      left: nullableDoubleFromJson(json['left'] as String?),
      top: nullableDoubleFromJson(json['top'] as String?),
      right: nullableDoubleFromJson(json['right'] as String?),
      bottom: nullableDoubleFromJson(json['bottom'] as String?),
      all: nullableDoubleFromJson(json['all'] as String?),
    );

Map<String, dynamic> _$PositionedArgumentsToJson(
        PositionedArguments instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'left': instance.left,
      'top': instance.top,
      'right': instance.right,
      'bottom': instance.bottom,
      'all': instance.all,
    };
