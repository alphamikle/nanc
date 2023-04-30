// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'positioned_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PositionedArguments _$PositionedArgumentsFromJson(Map<String, dynamic> json) =>
    PositionedArguments(
      width: nullableDoubleFromJson(json['width']),
      height: nullableDoubleFromJson(json['height']),
      left: nullableDoubleFromJson(json['left']),
      top: nullableDoubleFromJson(json['top']),
      right: nullableDoubleFromJson(json['right']),
      bottom: nullableDoubleFromJson(json['bottom']),
      all: nullableDoubleFromJson(json['all']),
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
