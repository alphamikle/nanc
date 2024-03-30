// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elevated_button_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElevatedButtonArguments _$ElevatedButtonArgumentsFromJson(
        Map<String, dynamic> json) =>
    ElevatedButtonArguments(
      onPressed: json['onPressed'] as String?,
      onHover: json['onHover'] as String?,
      onLongPress: json['onLongPress'] as String?,
      key: json['key'] as String?,
    );

Map<String, dynamic> _$ElevatedButtonArgumentsToJson(
        ElevatedButtonArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'onPressed': instance.onPressed,
      'onHover': instance.onHover,
      'onLongPress': instance.onLongPress,
    };
