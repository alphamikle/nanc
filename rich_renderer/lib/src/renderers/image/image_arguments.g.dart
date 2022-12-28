// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageArguments _$ImageArgumentsFromJson(Map<String, dynamic> json) =>
    ImageArguments(
      ref: json['ref'] as String?,
      color: colorFromJson(json['color'] as String?),
      width: stringToDoubleOrNull(json['width'] as String?),
      height: stringToDoubleOrNull(json['height'] as String?),
      fit: $enumDecodeNullable(_$BoxFitEnumMap, json['fit']),
    );

Map<String, dynamic> _$ImageArgumentsToJson(ImageArguments instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'color': colorToJson(instance.color),
      'width': instance.width,
      'height': instance.height,
      'fit': _$BoxFitEnumMap[instance.fit],
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
