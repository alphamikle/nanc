import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'text_button_arguments.g.dart';

@JsonSerializable()
class TextButtonArguments {
  const TextButtonArguments({
    required this.text,
    required this.onPressed,
    required this.onLongPress,
    required this.onHover,
  });

  factory TextButtonArguments.fromJson(dynamic json) => _$TextButtonArgumentsFromJson(castToJson(json));

  final String? text;
  final String? onPressed;
  final String? onLongPress;
  final String? onHover;

  Json toJson() => _$TextButtonArgumentsToJson(this);
}
