// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'padding_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaddingArguments _$PaddingArgumentsFromJson(Map<String, dynamic> json) =>
    PaddingArguments(
      left: nullableDoubleFromJson(json['left'] as String?),
      top: nullableDoubleFromJson(json['top'] as String?),
      right: nullableDoubleFromJson(json['right'] as String?),
      bottom: nullableDoubleFromJson(json['bottom'] as String?),
      all: nullableDoubleFromJson(json['all'] as String?),
    );

Map<String, dynamic> _$PaddingArgumentsToJson(PaddingArguments instance) =>
    <String, dynamic>{
      'left': instance.left,
      'top': instance.top,
      'right': instance.right,
      'bottom': instance.bottom,
      'all': instance.all,
    };
