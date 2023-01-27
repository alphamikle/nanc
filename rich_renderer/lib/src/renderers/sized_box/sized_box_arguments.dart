import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'sized_box_arguments.g.dart';

@JsonSerializable()
class SizedBoxArguments {
  const SizedBoxArguments({
    required this.height,
    required this.width,
    required this.size,
  });

  factory SizedBoxArguments.fromJson(dynamic json) => _$SizedBoxArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? height;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? width;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? size;

  Json toJson() => _$SizedBoxArgumentsToJson(this);
}
