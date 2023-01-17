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

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? all;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? scaleX;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? scaleY;

  Json toJson() => _$ScaleArgumentsToJson(this);
}
