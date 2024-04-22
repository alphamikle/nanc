// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_filter_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorFilterArguments _$ColorFilterArgumentsFromJson(
        Map<String, dynamic> json) =>
    ColorFilterArguments(
      color: nullableColorFromJson(json['color'] as String?),
      mode: $enumDecodeNullable(_$BlendModeEnumMap, json['mode'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$ColorFilterArgumentsToJson(
        ColorFilterArguments instance) =>
    <String, dynamic>{
      'color': colorToJson(instance.color),
      'mode': _$BlendModeEnumMap[instance.mode],
    };

const _$BlendModeEnumMap = {
  BlendMode.clear: 'clear',
  BlendMode.src: 'src',
  BlendMode.dst: 'dst',
  BlendMode.srcOver: 'srcOver',
  BlendMode.dstOver: 'dstOver',
  BlendMode.srcIn: 'srcIn',
  BlendMode.dstIn: 'dstIn',
  BlendMode.srcOut: 'srcOut',
  BlendMode.dstOut: 'dstOut',
  BlendMode.srcATop: 'srcATop',
  BlendMode.dstATop: 'dstATop',
  BlendMode.xor: 'xor',
  BlendMode.plus: 'plus',
  BlendMode.modulate: 'modulate',
  BlendMode.screen: 'screen',
  BlendMode.overlay: 'overlay',
  BlendMode.darken: 'darken',
  BlendMode.lighten: 'lighten',
  BlendMode.colorDodge: 'colorDodge',
  BlendMode.colorBurn: 'colorBurn',
  BlendMode.hardLight: 'hardLight',
  BlendMode.softLight: 'softLight',
  BlendMode.difference: 'difference',
  BlendMode.exclusion: 'exclusion',
  BlendMode.multiply: 'multiply',
  BlendMode.hue: 'hue',
  BlendMode.saturation: 'saturation',
  BlendMode.color: 'color',
  BlendMode.luminosity: 'luminosity',
};
