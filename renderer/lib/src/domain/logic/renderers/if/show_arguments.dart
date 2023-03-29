import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'show_arguments.g.dart';

@JsonSerializable()
class ShowArguments {
  const ShowArguments({
    required this.show,
    required this.notShow,
  });

  factory ShowArguments.fromJson(dynamic json) => _$ShowArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? show;

  @JsonKey(fromJson: nullableBoolFromJson)
  final bool? notShow;

  Json toJson() => _$ShowArgumentsToJson(this);
}
