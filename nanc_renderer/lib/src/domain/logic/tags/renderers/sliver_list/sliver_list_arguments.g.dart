// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sliver_list_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliverListArguments _$SliverListArgumentsFromJson(Map<String, dynamic> json) =>
    SliverListArguments(
      addKeepAlives: nullableBoolFromJson(json['addKeepAlives']),
      addRepaintBoundaries: nullableBoolFromJson(json['addRepaintBoundaries']),
      addSemanticIndexes: nullableBoolFromJson(json['addSemanticIndexes']),
      extent: nullableDoubleFromJson(json['extent']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$SliverListArgumentsToJson(
        SliverListArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'addKeepAlives': instance.addKeepAlives,
      'addRepaintBoundaries': instance.addRepaintBoundaries,
      'addSemanticIndexes': instance.addSemanticIndexes,
      'extent': instance.extent,
    };
