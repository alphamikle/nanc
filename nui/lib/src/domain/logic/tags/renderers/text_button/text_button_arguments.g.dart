// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_button_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextButtonArguments _$TextButtonArgumentsFromJson(Map<String, dynamic> json) =>
    TextButtonArguments(
      text: json['text'] as String?,
      onPressed: json['onPressed'] as String?,
      onLongPress: json['onLongPress'] as String?,
      onHover: json['onHover'] as String?,
      key: json['key'] as String?,
    );

Map<String, dynamic> _$TextButtonArgumentsToJson(
        TextButtonArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'text': instance.text,
      'onPressed': instance.onPressed,
      'onLongPress': instance.onLongPress,
      'onHover': instance.onHover,
    };
