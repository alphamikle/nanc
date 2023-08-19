import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'show_arguments.g.dart';

@JsonSerializable()
class ShowArguments {
  const ShowArguments({
    required this.ifTrue,
    required this.ifFalse,
  });

  factory ShowArguments.fromJson(dynamic json) => _$ShowArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? ifTrue;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? ifFalse;

  Json toJson() => _$ShowArgumentsToJson(this);
}
