import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'preferred_size_arguments.g.dart';

@JsonSerializable()
class PreferredSizeArguments {
  const PreferredSizeArguments({
    required this.height,
    required this.width,
  });

  factory PreferredSizeArguments.fromJson(dynamic json) => _$PreferredSizeArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? height;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? width;

  Json toJson() => _$PreferredSizeArgumentsToJson(this);
}
