// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_span_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WidgetSpanArguments _$WidgetSpanArgumentsFromJson(Map<String, dynamic> json) =>
    WidgetSpanArguments(
      baseline: $enumDecodeNullable(_$TextBaselineEnumMap, json['baseline'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      alignment: $enumDecodeNullable(
          _$PlaceholderAlignmentEnumMap, json['alignment'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$WidgetSpanArgumentsToJson(
        WidgetSpanArguments instance) =>
    <String, dynamic>{
      'baseline': _$TextBaselineEnumMap[instance.baseline],
      'alignment': _$PlaceholderAlignmentEnumMap[instance.alignment],
    };

const _$TextBaselineEnumMap = {
  TextBaseline.alphabetic: 'alphabetic',
  TextBaseline.ideographic: 'ideographic',
};

const _$PlaceholderAlignmentEnumMap = {
  PlaceholderAlignment.baseline: 'baseline',
  PlaceholderAlignment.aboveBaseline: 'aboveBaseline',
  PlaceholderAlignment.belowBaseline: 'belowBaseline',
  PlaceholderAlignment.top: 'top',
  PlaceholderAlignment.bottom: 'bottom',
  PlaceholderAlignment.middle: 'middle',
};
