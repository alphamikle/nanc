import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'text_span_arguments.g.dart';

enum MouseCursorEnum {
  none,
  basic,
  click,
  forbidden,
  wait,
  progress,
  contextMenu,
  help,
  text,
  verticalText,
  cell,
  precise,
  move,
  grab,
  grabbing,
  noDrop,
  alias,
  copy,
  disappearing,
  allScroll,
  zoomIn,
  zoomOut;

  SystemMouseCursor toMouseCursor() {
    return switch (this) {
      MouseCursorEnum.none => SystemMouseCursors.none,
      MouseCursorEnum.basic => SystemMouseCursors.basic,
      MouseCursorEnum.click => SystemMouseCursors.click,
      MouseCursorEnum.forbidden => SystemMouseCursors.forbidden,
      MouseCursorEnum.wait => SystemMouseCursors.wait,
      MouseCursorEnum.progress => SystemMouseCursors.progress,
      MouseCursorEnum.contextMenu => SystemMouseCursors.contextMenu,
      MouseCursorEnum.help => SystemMouseCursors.help,
      MouseCursorEnum.text => SystemMouseCursors.text,
      MouseCursorEnum.verticalText => SystemMouseCursors.verticalText,
      MouseCursorEnum.cell => SystemMouseCursors.cell,
      MouseCursorEnum.precise => SystemMouseCursors.precise,
      MouseCursorEnum.move => SystemMouseCursors.move,
      MouseCursorEnum.grab => SystemMouseCursors.grab,
      MouseCursorEnum.grabbing => SystemMouseCursors.grabbing,
      MouseCursorEnum.noDrop => SystemMouseCursors.noDrop,
      MouseCursorEnum.alias => SystemMouseCursors.alias,
      MouseCursorEnum.copy => SystemMouseCursors.copy,
      MouseCursorEnum.disappearing => SystemMouseCursors.disappearing,
      MouseCursorEnum.allScroll => SystemMouseCursors.allScroll,
      MouseCursorEnum.zoomIn => SystemMouseCursors.zoomIn,
      MouseCursorEnum.zoomOut => SystemMouseCursors.zoomOut,
    };
  }
}

@JsonSerializable()
class TextSpanArguments {
  const TextSpanArguments({
    required this.text,
    required this.cursor,
    required this.onEnter,
    required this.onExit,
    required this.onPressed,
    required this.color,
    required this.size,
    required this.spellOut,
    required this.separator,
    required this.skipEmptyLines,
  });

  factory TextSpanArguments.fromJson(dynamic json) => _$TextSpanArgumentsFromJson(castToJson(json));

  final String? text;

  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final MouseCursorEnum? cursor;

  final String? onEnter;

  final String? onExit;

  final String? onPressed;

  @JsonKey(fromJson: nullableColorFromJson, toJson: colorToJson)
  final Color? color;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? size;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? spellOut;

  final String? separator;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? skipEmptyLines;

  Json toJson() => _$TextSpanArgumentsToJson(this);
}
