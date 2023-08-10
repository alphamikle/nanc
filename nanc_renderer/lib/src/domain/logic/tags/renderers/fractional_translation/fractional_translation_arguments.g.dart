// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fractional_translation_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FractionalTranslationArguments _$FractionalTranslationArgumentsFromJson(
        Map<String, dynamic> json) =>
    FractionalTranslationArguments(
      dx: nullableDoubleFromJson(json['dx']),
      dy: nullableDoubleFromJson(json['dy']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$FractionalTranslationArgumentsToJson(
        FractionalTranslationArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'dx': instance.dx,
      'dy': instance.dy,
    };
