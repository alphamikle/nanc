import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../key_argument.dart';

part 'preferred_size_arguments.g.dart';

@JsonSerializable()
class PreferredSizeArguments extends KeyArgument {
  const PreferredSizeArguments({
    required this.height,
    required this.width,
    required super.key,
  });

  factory PreferredSizeArguments.fromJson(dynamic json) => _$PreferredSizeArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? height;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? width;

  @override
  Json toJson() => _$PreferredSizeArgumentsToJson(this);
}
