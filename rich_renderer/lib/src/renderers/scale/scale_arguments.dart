import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'scale_arguments.g.dart';

@JsonSerializable()
class ScaleArguments {
  const ScaleArguments({
    required this.all,
    required this.scaleX,
    required this.scaleY,
  });

  factory ScaleArguments.fromJson(dynamic json) => _$ScaleArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? all;

  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? scaleX;

  @JsonKey(fromJson: stringToDoubleOrNull)
  final double? scaleY;

  Json toJson() => _$ScaleArgumentsToJson(this);
}
