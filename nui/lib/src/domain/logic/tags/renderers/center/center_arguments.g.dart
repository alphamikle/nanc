// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'center_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CenterArguments _$CenterArgumentsFromJson(Map<String, dynamic> json) =>
    CenterArguments(
      heightFactor: nullableDoubleFromJson(json['heightFactor']),
      widthFactor: nullableDoubleFromJson(json['widthFactor']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$CenterArgumentsToJson(CenterArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'heightFactor': instance.heightFactor,
      'widthFactor': instance.widthFactor,
    };
