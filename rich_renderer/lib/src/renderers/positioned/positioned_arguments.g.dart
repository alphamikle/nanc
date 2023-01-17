// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'positioned_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PositionedArguments _$PositionedArgumentsFromJson(Map<String, dynamic> json) =>
    PositionedArguments(
      width: doubleOrNullFromJson(json['width'] as String?),
      height: doubleOrNullFromJson(json['height'] as String?),
      left: doubleOrNullFromJson(json['left'] as String?),
      top: doubleOrNullFromJson(json['top'] as String?),
      right: doubleOrNullFromJson(json['right'] as String?),
      bottom: doubleOrNullFromJson(json['bottom'] as String?),
      all: doubleOrNullFromJson(json['all'] as String?),
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
