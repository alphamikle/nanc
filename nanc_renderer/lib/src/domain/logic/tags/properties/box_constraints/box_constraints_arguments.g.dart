// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_constraints_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoxConstraintsArguments _$BoxConstraintsArgumentsFromJson(
        Map<String, dynamic> json) =>
    BoxConstraintsArguments(
      maxHeight: nullableDoubleFromJson(json['maxHeight']),
      maxWidth: nullableDoubleFromJson(json['maxWidth']),
      minHeight: nullableDoubleFromJson(json['minHeight']),
      minWidth: nullableDoubleFromJson(json['minWidth']),
    );

Map<String, dynamic> _$BoxConstraintsArgumentsToJson(
        BoxConstraintsArguments instance) =>
    <String, dynamic>{
      'maxHeight': instance.maxHeight,
      'maxWidth': instance.maxWidth,
      'minHeight': instance.minHeight,
      'minWidth': instance.minWidth,
    };
