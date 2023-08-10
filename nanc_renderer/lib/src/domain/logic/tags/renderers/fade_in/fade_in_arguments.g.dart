// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fade_in_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FadeInArguments _$FadeInArgumentsFromJson(Map<String, dynamic> json) =>
    FadeInArguments(
      duration: nullableIntFromJson(json['duration']),
      delay: nullableIntFromJson(json['delay']),
      curve: $enumDecodeNullable(_$CurveEnumEnumMap, json['curve'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$FadeInArgumentsToJson(FadeInArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'duration': instance.duration,
      'delay': instance.delay,
      'curve': _$CurveEnumEnumMap[instance.curve],
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
