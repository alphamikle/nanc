// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'svg_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SvgArguments _$SvgArgumentsFromJson(Map<String, dynamic> json) => SvgArguments(
      ref: json['ref'] as String?,
      vec: json['vec'] as String?,
      height: nullableDoubleFromJson(json['height']),
      width: nullableDoubleFromJson(json['width']),
      size: nullableDoubleFromJson(json['size']),
      alignment: $enumDecodeNullable(_$AlignmentEnumEnumMap, json['alignment'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      package: json['package'] as String?,
      fit: $enumDecodeNullable(_$BoxFitEnumMap, json['fit'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      drawOutside: nullableBoolFromJson(json['drawOutside']),
      clip: $enumDecodeNullable(_$ClipEnumMap, json['clip']),
      color: nullableColorFromJson(json['color'] as String?),
      matchTextDirection: nullableBoolFromJson(json['matchTextDirection']),
    );

Map<String, dynamic> _$SvgArgumentsToJson(SvgArguments instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'vec': instance.vec,
      'height': instance.height,
      'width': instance.width,
      'size': instance.size,
      'alignment': _$AlignmentEnumEnumMap[instance.alignment],
      'package': instance.package,
      'fit': _$BoxFitEnumMap[instance.fit],
      'drawOutside': instance.drawOutside,
      'clip': _$ClipEnumMap[instance.clip],
      'color': colorToJson(instance.color),
      'matchTextDirection': instance.matchTextDirection,
    };

const _$AlignmentEnumEnumMap = {
  AlignmentEnum.topLeft: 'topLeft',
  AlignmentEnum.topCenter: 'topCenter',
  AlignmentEnum.topRight: 'topRight',
  AlignmentEnum.centerLeft: 'centerLeft',
  AlignmentEnum.center: 'center',
  AlignmentEnum.centerRight: 'centerRight',
  AlignmentEnum.bottomLeft: 'bottomLeft',
  AlignmentEnum.bottomCenter: 'bottomCenter',
  AlignmentEnum.bottomRight: 'bottomRight',
};

const _$BoxFitEnumMap = {
  BoxFit.fill: 'fill',
  BoxFit.contain: 'contain',
  BoxFit.cover: 'cover',
  BoxFit.fitWidth: 'fitWidth',
  BoxFit.fitHeight: 'fitHeight',
  BoxFit.none: 'none',
  BoxFit.scaleDown: 'scaleDown',
};

const _$ClipEnumMap = {
  Clip.none: 'none',
  Clip.hardEdge: 'hardEdge',
  Clip.antiAlias: 'antiAlias',
  Clip.antiAliasWithSaveLayer: 'antiAliasWithSaveLayer',
};
