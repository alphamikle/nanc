// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'padding_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaddingArguments _$PaddingArgumentsFromJson(Map<String, dynamic> json) =>
    PaddingArguments(
      left: stringToDoubleOrNull(json['left'] as String?),
      top: stringToDoubleOrNull(json['top'] as String?),
      right: stringToDoubleOrNull(json['right'] as String?),
      bottom: stringToDoubleOrNull(json['bottom'] as String?),
      all: stringToDoubleOrNull(json['all'] as String?),
    );

Map<String, dynamic> _$PaddingArgumentsToJson(PaddingArguments instance) =>
    <String, dynamic>{
      'left': instance.left,
      'top': instance.top,
      'right': instance.right,
      'bottom': instance.bottom,
      'all': instance.all,
    };
