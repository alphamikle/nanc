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
      ..blurStyle = $enumDecodeNullable(_$BlurStyleEnumMap, json['blurStyle'])
      ..tileMode = $enumDecodeNullable(_$TileModeEnumMap, json['tileMode'])
      ..alignmentEnum =
          $enumDecodeNullable(_$AlignmentEnumEnumMap, json['alignmentEnum'])
      ..boxFit = $enumDecodeNullable(_$BoxFitEnumMap, json['boxFit'])
      ..materialType =
          $enumDecodeNullable(_$MaterialTypeEnumMap, json['materialType'])
      ..stackFit = $enumDecodeNullable(_$StackFitEnumMap, json['stackFit'])
      ..textAlign = $enumDecodeNullable(_$TextAlignEnumMap, json['textAlign'])
      ..textOverflow =
          $enumDecodeNullable(_$TextOverflowEnumMap, json['textOverflow'])
      ..fontWeightEnum =
          $enumDecodeNullable(_$FontWeightEnumEnumMap, json['fontWeightEnum'])
      ..textDecorationEnum = $enumDecodeNullable(
          _$TextDecorationEnumEnumMap, json['textDecorationEnum'])
      ..clip = $enumDecodeNullable(_$ClipEnumMap, json['clip'])
      ..boxShape = $enumDecodeNullable(_$BoxShapeEnumMap, json['boxShape'])
      ..curveEnum = $enumDecodeNullable(_$CurveEnumEnumMap, json['curveEnum'])
      ..scrollPhysicsEnum = $enumDecodeNullable(
          _$ScrollPhysicsEnumEnumMap, json['scrollPhysicsEnum'])
      ..axis = $enumDecodeNullable(_$AxisEnumMap, json['axis'])
      ..brightness =
          $enumDecodeNullable(_$BrightnessEnumMap, json['brightness'])
      ..collapseMode =
          $enumDecodeNullable(_$CollapseModeEnumMap, json['collapseMode'])
      ..textWidthBasis =
          $enumDecodeNullable(_$TextWidthBasisEnumMap, json['textWidthBasis'])
      ..fontStyle = $enumDecodeNullable(_$FontStyleEnumMap, json['fontStyle'])
      ..leadingDistribution = $enumDecodeNullable(
          _$TextLeadingDistributionEnumMap, json['leadingDistribution'])
      ..mouseCursor =
          $enumDecodeNullable(_$MouseCursorEnumEnumMap, json['mouseCursor'])
      ..placeholderAlignment = $enumDecodeNullable(
          _$PlaceholderAlignmentEnumMap, json['placeholderAlignment']);

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
      'blurStyle': _$BlurStyleEnumMap[instance.blurStyle],
      'tileMode': _$TileModeEnumMap[instance.tileMode],
      'alignmentEnum': _$AlignmentEnumEnumMap[instance.alignmentEnum],
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'materialType': _$MaterialTypeEnumMap[instance.materialType],
      'stackFit': _$StackFitEnumMap[instance.stackFit],
      'textAlign': _$TextAlignEnumMap[instance.textAlign],
      'textOverflow': _$TextOverflowEnumMap[instance.textOverflow],
      'fontWeightEnum': _$FontWeightEnumEnumMap[instance.fontWeightEnum],
      'textDecorationEnum':
          _$TextDecorationEnumEnumMap[instance.textDecorationEnum],
      'clip': _$ClipEnumMap[instance.clip],
      'boxShape': _$BoxShapeEnumMap[instance.boxShape],
      'curveEnum': _$CurveEnumEnumMap[instance.curveEnum],
      'scrollPhysicsEnum':
          _$ScrollPhysicsEnumEnumMap[instance.scrollPhysicsEnum],
      'axis': _$AxisEnumMap[instance.axis],
      'brightness': _$BrightnessEnumMap[instance.brightness],
      'collapseMode': _$CollapseModeEnumMap[instance.collapseMode],
      'textWidthBasis': _$TextWidthBasisEnumMap[instance.textWidthBasis],
      'fontStyle': _$FontStyleEnumMap[instance.fontStyle],
      'leadingDistribution':
          _$TextLeadingDistributionEnumMap[instance.leadingDistribution],
      'mouseCursor': _$MouseCursorEnumEnumMap[instance.mouseCursor],
      'placeholderAlignment':
          _$PlaceholderAlignmentEnumMap[instance.placeholderAlignment],
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

const _$BoxFitEnumMap = {
  BoxFit.fill: 'fill',
  BoxFit.contain: 'contain',
  BoxFit.cover: 'cover',
  BoxFit.fitWidth: 'fitWidth',
  BoxFit.fitHeight: 'fitHeight',
  BoxFit.none: 'none',
  BoxFit.scaleDown: 'scaleDown',
};

const _$MaterialTypeEnumMap = {
  MaterialType.canvas: 'canvas',
  MaterialType.card: 'card',
  MaterialType.circle: 'circle',
  MaterialType.button: 'button',
  MaterialType.transparency: 'transparency',
};

const _$StackFitEnumMap = {
  StackFit.loose: 'loose',
  StackFit.expand: 'expand',
  StackFit.passthrough: 'passthrough',
};

const _$TextAlignEnumMap = {
  TextAlign.left: 'left',
  TextAlign.right: 'right',
  TextAlign.center: 'center',
  TextAlign.justify: 'justify',
  TextAlign.start: 'start',
  TextAlign.end: 'end',
};

const _$TextOverflowEnumMap = {
  TextOverflow.clip: 'clip',
  TextOverflow.fade: 'fade',
  TextOverflow.ellipsis: 'ellipsis',
  TextOverflow.visible: 'visible',
};

const _$FontWeightEnumEnumMap = {
  FontWeightEnum.w100: 'w100',
  FontWeightEnum.w200: 'w200',
  FontWeightEnum.w300: 'w300',
  FontWeightEnum.w400: 'w400',
  FontWeightEnum.w500: 'w500',
  FontWeightEnum.w600: 'w600',
  FontWeightEnum.w700: 'w700',
  FontWeightEnum.w800: 'w800',
  FontWeightEnum.w900: 'w900',
  FontWeightEnum.normal: 'normal',
  FontWeightEnum.bold: 'bold',
};

const _$TextDecorationEnumEnumMap = {
  TextDecorationEnum.none: 'none',
  TextDecorationEnum.underline: 'underline',
  TextDecorationEnum.overline: 'overline',
  TextDecorationEnum.lineThrough: 'lineThrough',
};

const _$ClipEnumMap = {
  Clip.none: 'none',
  Clip.hardEdge: 'hardEdge',
  Clip.antiAlias: 'antiAlias',
  Clip.antiAliasWithSaveLayer: 'antiAliasWithSaveLayer',
};

const _$BoxShapeEnumMap = {
  BoxShape.rectangle: 'rectangle',
  BoxShape.circle: 'circle',
};

const _$CurveEnumEnumMap = {
  CurveEnum.linear: 'linear',
  CurveEnum.decelerate: 'decelerate',
  CurveEnum.fastLinearToSlowEaseIn: 'fastLinearToSlowEaseIn',
  CurveEnum.ease: 'ease',
  CurveEnum.easeIn: 'easeIn',
  CurveEnum.easeInToLinear: 'easeInToLinear',
  CurveEnum.easeInSine: 'easeInSine',
  CurveEnum.easeInQuad: 'easeInQuad',
  CurveEnum.easeInCubic: 'easeInCubic',
  CurveEnum.easeInQuart: 'easeInQuart',
  CurveEnum.easeInQuint: 'easeInQuint',
  CurveEnum.easeInExpo: 'easeInExpo',
  CurveEnum.easeInCirc: 'easeInCirc',
  CurveEnum.easeInBack: 'easeInBack',
  CurveEnum.easeOut: 'easeOut',
  CurveEnum.linearToEaseOut: 'linearToEaseOut',
  CurveEnum.easeOutSine: 'easeOutSine',
  CurveEnum.easeOutQuad: 'easeOutQuad',
  CurveEnum.easeOutCubic: 'easeOutCubic',
  CurveEnum.easeOutQuart: 'easeOutQuart',
  CurveEnum.easeOutQuint: 'easeOutQuint',
  CurveEnum.easeOutExpo: 'easeOutExpo',
  CurveEnum.easeOutCirc: 'easeOutCirc',
  CurveEnum.easeOutBack: 'easeOutBack',
  CurveEnum.easeInOut: 'easeInOut',
  CurveEnum.easeInOutSine: 'easeInOutSine',
  CurveEnum.easeInOutQuad: 'easeInOutQuad',
  CurveEnum.easeInOutCubic: 'easeInOutCubic',
  CurveEnum.easeInOutCubicEmphasized: 'easeInOutCubicEmphasized',
  CurveEnum.easeInOutQuart: 'easeInOutQuart',
  CurveEnum.easeInOutQuint: 'easeInOutQuint',
  CurveEnum.easeInOutExpo: 'easeInOutExpo',
  CurveEnum.easeInOutCirc: 'easeInOutCirc',
  CurveEnum.easeInOutBack: 'easeInOutBack',
  CurveEnum.fastOutSlowIn: 'fastOutSlowIn',
  CurveEnum.slowMiddle: 'slowMiddle',
  CurveEnum.bounceIn: 'bounceIn',
  CurveEnum.bounceOut: 'bounceOut',
  CurveEnum.bounceInOut: 'bounceInOut',
  CurveEnum.elasticIn: 'elasticIn',
  CurveEnum.elasticOut: 'elasticOut',
  CurveEnum.elasticInOut: 'elasticInOut',
};

const _$ScrollPhysicsEnumEnumMap = {
  ScrollPhysicsEnum.always: 'always',
  ScrollPhysicsEnum.bouncing: 'bouncing',
  ScrollPhysicsEnum.clamping: 'clamping',
  ScrollPhysicsEnum.fixedExtent: 'fixedExtent',
  ScrollPhysicsEnum.never: 'never',
  ScrollPhysicsEnum.page: 'page',
  ScrollPhysicsEnum.range: 'range',
};

const _$AxisEnumMap = {
  Axis.horizontal: 'horizontal',
  Axis.vertical: 'vertical',
};

const _$BrightnessEnumMap = {
  Brightness.dark: 'dark',
  Brightness.light: 'light',
};

const _$CollapseModeEnumMap = {
  CollapseMode.parallax: 'parallax',
  CollapseMode.pin: 'pin',
  CollapseMode.none: 'none',
};

const _$TextWidthBasisEnumMap = {
  TextWidthBasis.parent: 'parent',
  TextWidthBasis.longestLine: 'longestLine',
};

const _$FontStyleEnumMap = {
  FontStyle.normal: 'normal',
  FontStyle.italic: 'italic',
};

const _$TextLeadingDistributionEnumMap = {
  TextLeadingDistribution.proportional: 'proportional',
  TextLeadingDistribution.even: 'even',
};

const _$MouseCursorEnumEnumMap = {
  MouseCursorEnum.none: 'none',
  MouseCursorEnum.basic: 'basic',
  MouseCursorEnum.click: 'click',
  MouseCursorEnum.forbidden: 'forbidden',
  MouseCursorEnum.wait: 'wait',
  MouseCursorEnum.progress: 'progress',
  MouseCursorEnum.contextMenu: 'contextMenu',
  MouseCursorEnum.help: 'help',
  MouseCursorEnum.text: 'text',
  MouseCursorEnum.verticalText: 'verticalText',
  MouseCursorEnum.cell: 'cell',
  MouseCursorEnum.precise: 'precise',
  MouseCursorEnum.move: 'move',
  MouseCursorEnum.grab: 'grab',
  MouseCursorEnum.grabbing: 'grabbing',
  MouseCursorEnum.noDrop: 'noDrop',
  MouseCursorEnum.alias: 'alias',
  MouseCursorEnum.copy: 'copy',
  MouseCursorEnum.disappearing: 'disappearing',
  MouseCursorEnum.allScroll: 'allScroll',
  MouseCursorEnum.zoomIn: 'zoomIn',
  MouseCursorEnum.zoomOut: 'zoomOut',
};

const _$PlaceholderAlignmentEnumMap = {
  PlaceholderAlignment.baseline: 'baseline',
  PlaceholderAlignment.aboveBaseline: 'aboveBaseline',
  PlaceholderAlignment.belowBaseline: 'belowBaseline',
  PlaceholderAlignment.top: 'top',
  PlaceholderAlignment.bottom: 'bottom',
  PlaceholderAlignment.middle: 'middle',
};
