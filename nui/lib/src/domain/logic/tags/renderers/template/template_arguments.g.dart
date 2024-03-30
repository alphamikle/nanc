// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateArguments _$TemplateArgumentsFromJson(Map<String, dynamic> json) =>
    TemplateArguments(
      id: json['id'] as String?,
      arguments: (json['arguments'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$TemplateArgumentsToJson(TemplateArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'arguments': instance.arguments,
    };
