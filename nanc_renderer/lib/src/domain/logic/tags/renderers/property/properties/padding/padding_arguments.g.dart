// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'padding_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaddingArguments _$PaddingArgumentsFromJson(Map<String, dynamic> json) =>
    PaddingArguments(
      left: nullableDoubleFromJson(json['left']),
      top: nullableDoubleFromJson(json['top']),
      right: nullableDoubleFromJson(json['right']),
      bottom: nullableDoubleFromJson(json['bottom']),
      all: nullableDoubleFromJson(json['all']),
    );

Map<String, dynamic> _$PaddingArgumentsToJson(PaddingArguments instance) =>
    <String, dynamic>{
      'left': instance.left,
      'top': instance.top,
      'right': instance.right,
      'bottom': instance.bottom,
      'all': instance.all,
    };
