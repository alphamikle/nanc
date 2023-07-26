import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'elevated_button_arguments.g.dart';

@JsonSerializable()
class ElevatedButtonArguments {
  const ElevatedButtonArguments({
    required this.onPressed,
    required this.onHover,
    required this.onLongPress,
  });

  factory ElevatedButtonArguments.fromJson(dynamic json) => _$ElevatedButtonArgumentsFromJson(castToJson(json));

  final String? onPressed;
  final String? onHover;
  final String? onLongPress;

  Json toJson() => _$ElevatedButtonArgumentsToJson(this);
}
