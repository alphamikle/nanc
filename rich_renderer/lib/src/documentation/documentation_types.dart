import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rich_renderer/src/renderers/property/properties/alignment/alignment_arguments.dart';

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
  static Set<String> get strokeAlignValues => _$StrokeAlignEnumMap.values.toSet();
  static Set<String> get blurStyleValues => _$BlurStyleEnumMap.values.toSet();
  static Set<String> get tileModeValues => _$TileModeEnumMap.values.toSet();
  static Set<String> get alignmentEnumValues => _$AlignmentEnumEnumMap.values.toSet();
  static Set<String> get boxFitValues => _$BoxFitEnumMap.values.toSet();

  CrossAxisAlignment? crossAxisAlignment;
  MainAxisSize? mainAxisSize;
  MainAxisAlignment? mainAxisAlignment;
  VerticalDirection? verticalDirection;
  TextDirection? textDirection;
  TextBaseline? textBaseline;
  BlendMode? blendMode;
  StrokeAlign? strokeAlign;
  BlurStyle? blurStyle;
  TileMode? tileMode;
  AlignmentEnum? alignmentEnum;
  BoxFit? boxFit;
}
