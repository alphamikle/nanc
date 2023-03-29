// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'row_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RowArguments _$RowArgumentsFromJson(Map<String, dynamic> json) => RowArguments(
      crossAxisAlignment: $enumDecodeNullable(
          _$CrossAxisAlignmentEnumMap, json['crossAxisAlignment'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      mainAxisSize: $enumDecodeNullable(
          _$MainAxisSizeEnumMap, json['mainAxisSize'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      mainAxisAlignment: $enumDecodeNullable(
          _$MainAxisAlignmentEnumMap, json['mainAxisAlignment'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      verticalDirection: $enumDecodeNullable(
          _$VerticalDirectionEnumMap, json['verticalDirection'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      textDirection: $enumDecodeNullable(
          _$TextDirectionEnumMap, json['textDirection'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      textBaseline: $enumDecodeNullable(
          _$TextBaselineEnumMap, json['textBaseline'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$RowArgumentsToJson(RowArguments instance) =>
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
