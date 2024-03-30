// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageArguments _$ImageArgumentsFromJson(Map<String, dynamic> json) =>
    ImageArguments(
      ref: json['ref'] as String?,
      color: nullableColorFromJson(json['color'] as String?),
      width: nullableDoubleFromJson(json['width']),
      height: nullableDoubleFromJson(json['height']),
      fit: $enumDecodeNullable(_$BoxFitEnumMap, json['fit'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      blurHash: json['blurHash'] as String?,
      useCache:
          json['useCache'] == null ? true : boolFromJson(json['useCache']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$ImageArgumentsToJson(ImageArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'ref': instance.ref,
      'color': colorToJson(instance.color),
      'width': instance.width,
      'height': instance.height,
      'fit': _$BoxFitEnumMap[instance.fit],
      'blurHash': instance.blurHash,
      'useCache': instance.useCache,
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
