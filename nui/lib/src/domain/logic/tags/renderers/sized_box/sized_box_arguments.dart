import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../key_argument.dart';

part 'sized_box_arguments.g.dart';

@JsonSerializable()
class SizedBoxArguments extends KeyArgument {
  const SizedBoxArguments({
    required this.height,
    required this.width,
    required this.size,
    required super.key,
  });

  factory SizedBoxArguments.fromJson(dynamic json) => _$SizedBoxArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? height;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? width;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? size;

  @override
  Json toJson() => _$SizedBoxArgumentsToJson(this);
}
