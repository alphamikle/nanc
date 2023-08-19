// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sliver_app_bar_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliverAppBarArguments _$SliverAppBarArgumentsFromJson(
        Map<String, dynamic> json) =>
    SliverAppBarArguments(
      floating: nullableBoolFromJson(json['floating']),
      pinned: nullableBoolFromJson(json['pinned']),
      backgroundColor:
          nullableColorFromJson(json['backgroundColor'] as String?),
      shadowColor: nullableColorFromJson(json['shadowColor'] as String?),
      surfaceTintColor:
          nullableColorFromJson(json['surfaceTintColor'] as String?),
      elevation: nullableDoubleFromJson(json['elevation']),
      autoLeading: nullableBoolFromJson(json['autoLeading']),
      centerTitle: nullableBoolFromJson(json['centerTitle']),
      collapsedHeight: nullableDoubleFromJson(json['collapsedHeight']),
      expandedHeight: nullableDoubleFromJson(json['expandedHeight']),
      forceElevated: nullableBoolFromJson(json['forceElevated']),
      forceMaterialTransparency:
          nullableBoolFromJson(json['forceMaterialTransparency']),
      foregroundColor:
          nullableColorFromJson(json['foregroundColor'] as String?),
      leadingWidth: nullableDoubleFromJson(json['leadingWidth']),
      snap: nullableBoolFromJson(json['snap']),
      stretch: nullableBoolFromJson(json['stretch']),
      onStretchTrigger: json['onStretchTrigger'] as String?,
      scrolledUnderElevation:
          nullableDoubleFromJson(json['scrolledUnderElevation']),
      stretchTriggerOffset:
          nullableDoubleFromJson(json['stretchTriggerOffset']),
      titleSpacing: nullableDoubleFromJson(json['titleSpacing']),
      toolbarHeight: nullableDoubleFromJson(json['toolbarHeight']),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$SliverAppBarArgumentsToJson(
        SliverAppBarArguments instance) =>
    <String, dynamic>{
      'key': instance.key,
      'floating': instance.floating,
      'pinned': instance.pinned,
      'backgroundColor': colorToJson(instance.backgroundColor),
      'shadowColor': colorToJson(instance.shadowColor),
      'surfaceTintColor': colorToJson(instance.surfaceTintColor),
      'elevation': instance.elevation,
      'autoLeading': instance.autoLeading,
      'centerTitle': instance.centerTitle,
      'collapsedHeight': instance.collapsedHeight,
      'expandedHeight': instance.expandedHeight,
      'forceElevated': instance.forceElevated,
      'forceMaterialTransparency': instance.forceMaterialTransparency,
      'foregroundColor': colorToJson(instance.foregroundColor),
      'leadingWidth': instance.leadingWidth,
      'snap': instance.snap,
      'stretch': instance.stretch,
      'onStretchTrigger': instance.onStretchTrigger,
      'scrolledUnderElevation': instance.scrolledUnderElevation,
      'stretchTriggerOffset': instance.stretchTriggerOffset,
      'titleSpacing': instance.titleSpacing,
      'toolbarHeight': instance.toolbarHeight,
    };
