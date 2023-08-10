// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ink_well_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InkWellArguments _$InkWellArgumentsFromJson(Map<String, dynamic> json) =>
    InkWellArguments(
      onPressed: json['onPressed'] as String?,
      onDoubleTap: json['onDoubleTap'] as String?,
      onLongPress: json['onLongPress'] as String?,
      onHover: json['onHover'] as String?,
      focusColor: nullableColorFromJson(json['focusColor'] as String?),
      overlayColor: nullableColorFromJson(json['overlayColor'] as String?),
      highlightColor: nullableColorFromJson(json['highlightColor'] as String?),
      splashColor: nullableColorFromJson(json['splashColor'] as String?),
      hoverColor: nullableColorFromJson(json['hoverColor'] as String?),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$InkWellArgumentsToJson(InkWellArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'onPressed': instance.onPressed,
      'onDoubleTap': instance.onDoubleTap,
      'onLongPress': instance.onLongPress,
      'onHover': instance.onHover,
      'focusColor': colorToJson(instance.focusColor),
      'overlayColor': colorToJson(instance.overlayColor),
      'highlightColor': colorToJson(instance.highlightColor),
      'splashColor': colorToJson(instance.splashColor),
      'hoverColor': colorToJson(instance.hoverColor),
    };
