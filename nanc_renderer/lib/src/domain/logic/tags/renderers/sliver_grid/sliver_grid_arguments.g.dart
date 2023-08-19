// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sliver_grid_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliverGridArguments _$SliverGridArgumentsFromJson(Map<String, dynamic> json) =>
    SliverGridArguments(
      addKeepAlives: nullableBoolFromJson(json['addKeepAlives']),
      addRepaintBoundaries: nullableBoolFromJson(json['addRepaintBoundaries']),
      addSemanticIndexes: nullableBoolFromJson(json['addSemanticIndexes']),
      extent: nullableDoubleFromJson(json['extent']),
      crossAxisCount: nullableIntFromJson(json['crossAxisCount']),
      childAspectRatio: nullableDoubleFromJson(json['childAspectRatio']),
      crossAxisSpacing: nullableDoubleFromJson(json['crossAxisSpacing']),
      mainAxisSpacing: nullableDoubleFromJson(json['mainAxisSpacing']),
      maxCrossAxisExtent: nullableDoubleFromJson(json['maxCrossAxisExtent']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$SliverGridArgumentsToJson(
        SliverGridArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'addKeepAlives': instance.addKeepAlives,
      'addRepaintBoundaries': instance.addRepaintBoundaries,
      'addSemanticIndexes': instance.addSemanticIndexes,
      'extent': instance.extent,
      'crossAxisCount': instance.crossAxisCount,
      'childAspectRatio': instance.childAspectRatio,
      'crossAxisSpacing': instance.crossAxisSpacing,
      'mainAxisSpacing': instance.mainAxisSpacing,
      'maxCrossAxisExtent': instance.maxCrossAxisExtent,
    };
