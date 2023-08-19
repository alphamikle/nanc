// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rotated_box_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RotatedBoxArguments _$RotatedBoxArgumentsFromJson(Map<String, dynamic> json) =>
    RotatedBoxArguments(
      turns: nullableIntFromJson(json['turns']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$RotatedBoxArgumentsToJson(
        RotatedBoxArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'turns': instance.turns,
    };
