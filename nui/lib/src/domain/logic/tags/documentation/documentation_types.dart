import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../properties/alignment/alignment_arguments.dart';
import '../properties/border/border_arguments.dart';
import '../properties/input_border/input_border_arguments.dart';
import '../properties/text_style/text_decoration_enum.dart';
import '../renderers/fade_in/curve_enum.dart';
import '../renderers/list_view/list_view_arguments.dart';
import '../renderers/rich_text/text_span/text_span_arguments.dart';
import '../renderers/switch/switch_arguments.dart';
import '../renderers/text_field/text_field_arguments.dart';

part 'documentation_types.g.dart';

@JsonSerializable()
class DocumentationTypes {
  static Set<String> get crossAxisAlignmentValues => _$CrossAxisAlignmentEnumMap.values.toSet();

  static Set<String> get mainAxisSizeValues => _$MainAxisSizeEnumMap.values.toSet();

  static Set<String> get mainAxisAlignmentValues => _$MainAxisAlignmentEnumMap.values.toSet();

  static Set<String> get verticalDirectionValues => _$VerticalDirectionEnumMap.values.toSet();

  static Set<String> get textDirectionValues => _$VerticalDirectionEnumMap.values.toSet();

  static Set<String> get textBaselineValues => _$TextBaselineEnumMap.values.toSet();

  static Set<String> get blendModeValues => _$BlendModeEnumMap.values.toSet();

  static Set<String> get blurStyleValues => _$BlurStyleEnumMap.values.toSet();

  static Set<String> get tileModeValues => _$TileModeEnumMap.values.toSet();

  static Set<String> get alignmentEnumValues => _$AlignmentEnumEnumMap.values.toSet();

  static Set<String> get boxFitValues => _$BoxFitEnumMap.values.toSet();

  static Set<String> get materialTypeValues => _$MaterialTypeEnumMap.values.toSet();

  static Set<String> get stackFitValues => _$StackFitEnumMap.values.toSet();

  static Set<String> get textAlignValues => _$TextAlignEnumMap.values.toSet();

  static Set<String> get textOverflowValues => _$TextOverflowEnumMap.values.toSet();

  static Set<String> get fontWeightEnumValues => _$FontWeightEnumEnumMap.values.toSet();

  static Set<String> get textDecorationEnumValues => _$TextDecorationEnumEnumMap.values.toSet();

  static Set<String> get clipValues => _$ClipEnumMap.values.toSet();

  static Set<String> get boxShapeValues => _$BoxShapeEnumMap.values.toSet();

  static Set<String> get curveEnumValues => _$CurveEnumEnumMap.values.toSet();

  static Set<String> get scrollPhysicsEnumValues => _$ScrollPhysicsEnumEnumMap.values.toSet();

  static Set<String> get axisValues => _$AxisEnumMap.values.toSet();

  static Set<String> get brightnessValues => _$BrightnessEnumMap.values.toSet();

  static Set<String> get collapseModeValues => _$CollapseModeEnumMap.values.toSet();

  static Set<String> get textWidthBasisValues => _$TextWidthBasisEnumMap.values.toSet();

  static Set<String> get fontStyleValues => _$FontStyleEnumMap.values.toSet();

  static Set<String> get leadingDistributionValues => _$TextLeadingDistributionEnumMap.values.toSet();

  static Set<String> get mouseCursorEnumValues => _$MouseCursorEnumEnumMap.values.toSet();

  static Set<String> get placeholderAlignmentValues => _$PlaceholderAlignmentEnumMap.values.toSet();

  static Set<String> get autovalidateModeValues => _$AutovalidateModeEnumMap.values.toSet();

  static Set<String> get textInputTypeEnumValues => _$TextInputTypeEnumEnumMap.values.toSet();

  static Set<String> get textCapitalizationValues => _$TextCapitalizationEnumMap.values.toSet();

  static Set<String> get textInputActionValues => _$TextInputActionEnumMap.values.toSet();

  static Set<String> get inputBorderTypeValues => _$InputBorderTypeEnumMap.values.toSet();

  static Set<String> get borderStyleValues => _$BorderStyleEnumMap.values.toSet();

  static Set<String> get strokeAlignEnumValues => _$StrokeAlignEnumEnumMap.values.toSet();

  static Set<String> get switchStyleValues => _$StyleEnumMap.values.toSet();

  /// Place some enum here to force codegen create values and use them as a static getters
  CrossAxisAlignment? crossAxisAlignment;
  MainAxisSize? mainAxisSize;
  MainAxisAlignment? mainAxisAlignment;
  VerticalDirection? verticalDirection;
  TextDirection? textDirection;
  TextBaseline? textBaseline;
  BlendMode? blendMode;
  BlurStyle? blurStyle;
  TileMode? tileMode;
  AlignmentEnum? alignmentEnum;
  BoxFit? boxFit;
  MaterialType? materialType;
  StackFit? stackFit;
  TextAlign? textAlign;
  TextOverflow? textOverflow;
  FontWeightEnum? fontWeightEnum;
  TextDecorationEnum? textDecorationEnum;
  Clip? clip;
  BoxShape? boxShape;
  CurveEnum? curveEnum;
  ScrollPhysicsEnum? scrollPhysicsEnum;
  Axis? axis;
  Brightness? brightness;
  CollapseMode? collapseMode;
  TextWidthBasis? textWidthBasis;
  FontStyle? fontStyle;
  TextLeadingDistribution? leadingDistribution;
  MouseCursorEnum? mouseCursor;
  PlaceholderAlignment? placeholderAlignment;
  AutovalidateMode? autovalidateMode;
  TextInputTypeEnum? textInputTypeEnum;
  TextCapitalization? textCapitalization;
  TextInputAction? textInputAction;
  InputBorderType? inputBorderType;
  BorderStyle? borderStyle;
  StrokeAlignEnum? strokeAlignEnum;
  Style? switchStyle;
}
