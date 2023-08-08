import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'rotated_box_arguments.g.dart';

@JsonSerializable()
class RotatedBoxArguments {
  const RotatedBoxArguments({
    required this.turns,
  });

  factory RotatedBoxArguments.fromJson(dynamic json) => _$RotatedBoxArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableIntFromJson)
  final int? turns;

  Json toJson() => _$RotatedBoxArgumentsToJson(this);
}
