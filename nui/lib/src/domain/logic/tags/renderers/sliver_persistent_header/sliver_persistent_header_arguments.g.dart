// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sliver_persistent_header_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliverPersistentHeaderArguments _$SliverPersistentHeaderArgumentsFromJson(
        Map<String, dynamic> json) =>
    SliverPersistentHeaderArguments(
      pinned: nullableBoolFromJson(json['pinned']),
      floating: nullableBoolFromJson(json['floating']),
      maxExtent: nullableDoubleFromJson(json['maxExtent']),
      minExtent: nullableDoubleFromJson(json['minExtent']),
      height: nullableDoubleFromJson(json['height']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$SliverPersistentHeaderArgumentsToJson(
        SliverPersistentHeaderArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'pinned': instance.pinned,
      'floating': instance.floating,
      'maxExtent': instance.maxExtent,
      'minExtent': instance.minExtent,
      'height': instance.height,
    };
