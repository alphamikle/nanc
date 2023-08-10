import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../key_argument.dart';

part 'elevated_button_arguments.g.dart';

@JsonSerializable()
class ElevatedButtonArguments extends KeyArgument {
  const ElevatedButtonArguments({
    required this.onPressed,
    required this.onHover,
    required this.onLongPress,
    required super.key,
  });

  factory ElevatedButtonArguments.fromJson(dynamic json) => _$ElevatedButtonArgumentsFromJson(castToJson(json));

  final String? onPressed;
  final String? onHover;
  final String? onLongPress;

  @override
  Json toJson() => _$ElevatedButtonArgumentsToJson(this);
}
