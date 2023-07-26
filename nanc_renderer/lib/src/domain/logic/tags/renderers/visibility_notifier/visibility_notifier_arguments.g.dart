// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visibility_notifier_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisibilityNotifierArguments _$VisibilityNotifierArgumentsFromJson(
        Map<String, dynamic> json) =>
    VisibilityNotifierArguments(
      onShow: json['onShow'] as String?,
      onHide: json['onHide'] as String?,
      lifetime: json['lifetime'] as String?,
    );

Map<String, dynamic> _$VisibilityNotifierArgumentsToJson(
        VisibilityNotifierArguments instance) =>
    <String, dynamic>{
      'onShow': instance.onShow,
      'onHide': instance.onHide,
      'lifetime': instance.lifetime,
    };
