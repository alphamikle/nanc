// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ink_well_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InkWellArguments _$InkWellArgumentsFromJson(Map<String, dynamic> json) =>
    InkWellArguments(
      onPressed: json['onPressed'] as String?,
      focusColor: colorFromJson(json['focusColor'] as String?),
      overlayColor: colorFromJson(json['overlayColor'] as String?),
      highlightColor: colorFromJson(json['highlightColor'] as String?),
      splashColor: colorFromJson(json['splashColor'] as String?),
      hoverColor: colorFromJson(json['hoverColor'] as String?),
    );

Map<String, dynamic> _$InkWellArgumentsToJson(InkWellArguments instance) =>
    <String, dynamic>{
      'onPressed': instance.onPressed,
      'focusColor': colorToJson(instance.focusColor),
      'overlayColor': colorToJson(instance.overlayColor),
      'highlightColor': colorToJson(instance.highlightColor),
      'splashColor': colorToJson(instance.splashColor),
      'hoverColor': colorToJson(instance.hoverColor),
    };
