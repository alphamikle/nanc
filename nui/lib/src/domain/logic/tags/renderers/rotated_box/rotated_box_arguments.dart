import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../key_argument.dart';

part 'rotated_box_arguments.g.dart';

@JsonSerializable()
class RotatedBoxArguments extends KeyArgument {
  const RotatedBoxArguments({
    required this.turns,
    required super.key,
  });

  factory RotatedBoxArguments.fromJson(dynamic json) => _$RotatedBoxArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableIntFromJson)
  final int? turns;

  @override
  Json toJson() => _$RotatedBoxArgumentsToJson(this);
}
