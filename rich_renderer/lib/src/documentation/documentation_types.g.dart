// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documentation_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentationTypes _$DocumentationTypesFromJson(Map<String, dynamic> json) =>
    DocumentationTypes()
      ..crossAxisAlignment = $enumDecodeNullable(
          _$CrossAxisAlignmentEnumMap, json['crossAxisAlignment'])
      ..mainAxisSize =
          $enumDecodeNullable(_$MainAxisSizeEnumMap, json['mainAxisSize'])
      ..mainAxisAlignment = $enumDecodeNullable(
          _$MainAxisAlignmentEnumMap, json['mainAxisAlignment'])
      ..verticalDirection = $enumDecodeNullable(
          _$VerticalDirectionEnumMap, json['verticalDirection'])
      ..textDirection =
          $enumDecodeNullable(_$TextDirectionEnumMap, json['textDirection'])
      ..textBaseline =
          $enumDecodeNullable(_$TextBaselineEnumMap, json['textBaseline'])
      ..blendMode = $enumDecodeNullable(_$BlendModeEnumMap, json['blendMode'])
      ..strokeAlign =
          $enumDecodeNullable(_$StrokeAlignEnumMap, json['strokeAlign'])
      ..blurStyle = $enumDecodeNullable(_$BlurStyleEnumMap, json['blurStyle'])
      ..tileMode = $enumDecodeNullable(_$TileModeEnumMap, json['tileMode'])
      ..alignmentEnum =
          $enumDecodeNullable(_$AlignmentEnumEnumMap, json['alignmentEnum']);

Map<String, dynamic> _$DocumentationTypesToJson(DocumentationTypes instance) =>
    <String, dynamic>{
      'crossAxisAlignment':
          _$CrossAxisAlignmentEnumMap[instance.crossAxisAlignment],
      'mainAxisSize': _$MainAxisSizeEnumMap[instance.mainAxisSize],
      'mainAxisAlignment':
          _$MainAxisAlignmentEnumMap[instance.mainAxisAlignment],
      'verticalDirection':
          _$VerticalDirectionEnumMap[instance.verticalDirection],
      'textDirection': _$TextDirectionEnumMap[instance.textDirection],
      'textBaseline': _$TextBaselineEnumMap[instance.textBaseline],
      'blendMode': _$BlendModeEnumMap[instance.blendMode],
      'strokeAlign': _$StrokeAlignEnumMap[instance.strokeAlign],
      'blurStyle': _$BlurStyleEnumMap[instance.blurStyle],
      'tileMode': _$TileModeEnumMap[instance.tileMode],
      'alignmentEnum': _$AlignmentEnumEnumMap[instance.alignmentEnum],
    };

const _$CrossAxisAlignmentEnumMap = {
  CrossAxisAlignment.start: 'start',
  CrossAxisAlignment.end: 'end',
  CrossAxisAlignment.center: 'center',
  CrossAxisAlignment.stretch: 'stretch',
  CrossAxisAlignment.baseline: 'baseline',
};

const _$MainAxisSizeEnumMap = {
  MainAxisSize.min: 'min',
  MainAxisSize.max: 'max',
};

const _$MainAxisAlignmentEnumMap = {
  MainAxisAlignment.start: 'start',
  MainAxisAlignment.end: 'end',
  MainAxisAlignment.center: 'center',
  MainAxisAlignment.spaceBetween: 'spaceBetween',
  MainAxisAlignment.spaceAround: 'spaceAround',
  MainAxisAlignment.spaceEvenly: 'spaceEvenly',
};

const _$VerticalDirectionEnumMap = {
  VerticalDirection.up: 'up',
  VerticalDirection.down: 'down',
};

const _$TextDirectionEnumMap = {
  TextDirection.rtl: 'rtl',
  TextDirection.ltr: 'ltr',
};

const _$TextBaselineEnumMap = {
  TextBaseline.alphabetic: 'alphabetic',
  TextBaseline.ideographic: 'ideographic',
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

const _$StrokeAlignEnumMap = {
  StrokeAlign.inside: 'inside',
  StrokeAlign.center: 'center',
  StrokeAlign.outside: 'outside',
};

const _$BlurStyleEnumMap = {
  BlurStyle.normal: 'normal',
  BlurStyle.solid: 'solid',
  BlurStyle.outer: 'outer',
  BlurStyle.inner: 'inner',
};

const _$TileModeEnumMap = {
  TileMode.clamp: 'clamp',
  TileMode.repeated: 'repeated',
  TileMode.mirror: 'mirror',
  TileMode.decal: 'decal',
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
