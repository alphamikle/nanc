// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'padding_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaddingArguments _$PaddingArgumentsFromJson(Map<String, dynamic> json) =>
    PaddingArguments(
      left: doubleOrNullFromJson(json['left'] as String?),
      top: doubleOrNullFromJson(json['top'] as String?),
      right: doubleOrNullFromJson(json['right'] as String?),
      bottom: doubleOrNullFromJson(json['bottom'] as String?),
      all: doubleOrNullFromJson(json['all'] as String?),
    );

Map<String, dynamic> _$PaddingArgumentsToJson(PaddingArguments instance) =>
    <String, dynamic>{
      'left': instance.left,
      'top': instance.top,
      'right': instance.right,
      'bottom': instance.bottom,
      'all': instance.all,
    };
