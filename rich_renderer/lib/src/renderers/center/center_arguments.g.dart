// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'center_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CenterArguments _$CenterArgumentsFromJson(Map<String, dynamic> json) =>
    CenterArguments(
      heightFactor: doubleOrNullFromJson(json['heightFactor'] as String?),
      widthFactor: doubleOrNullFromJson(json['widthFactor'] as String?),
    );

Map<String, dynamic> _$CenterArgumentsToJson(CenterArguments instance) =>
    <String, dynamic>{
      'heightFactor': instance.heightFactor,
      'widthFactor': instance.widthFactor,
    };
