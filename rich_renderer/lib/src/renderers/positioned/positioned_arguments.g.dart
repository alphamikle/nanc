// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'positioned_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PositionedArguments _$PositionedArgumentsFromJson(Map<String, dynamic> json) =>
    PositionedArguments(
      width: stringToDoubleOrNull(json['width'] as String?),
      height: stringToDoubleOrNull(json['height'] as String?),
      left: stringToDoubleOrNull(json['left'] as String?),
      top: stringToDoubleOrNull(json['top'] as String?),
      right: stringToDoubleOrNull(json['right'] as String?),
      bottom: stringToDoubleOrNull(json['bottom'] as String?),
      all: stringToDoubleOrNull(json['all'] as String?),
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
