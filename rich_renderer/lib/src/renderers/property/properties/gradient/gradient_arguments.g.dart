// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradient_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GradientArguments _$GradientArgumentsFromJson(Map<String, dynamic> json) =>
    GradientArguments(
      tileMode: $enumDecodeNullable(_$TileModeEnumMap, json['tileMode']),
    );

Map<String, dynamic> _$GradientArgumentsToJson(GradientArguments instance) =>
    <String, dynamic>{
      'tileMode': _$TileModeEnumMap[instance.tileMode],
    };

const _$TileModeEnumMap = {
  TileMode.clamp: 'clamp',
  TileMode.repeated: 'repeated',
  TileMode.mirror: 'mirror',
  TileMode.decal: 'decal',
};
