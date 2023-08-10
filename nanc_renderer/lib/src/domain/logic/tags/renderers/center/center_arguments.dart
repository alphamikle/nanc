import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../key_argument.dart';

part 'center_arguments.g.dart';

@JsonSerializable()
class CenterArguments extends KeyArgument {
  const CenterArguments({
    required this.heightFactor,
    required this.widthFactor,
    required super.key,
  });

  factory CenterArguments.fromJson(dynamic json) => _$CenterArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? heightFactor;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? widthFactor;

  @override
  Json toJson() => _$CenterArgumentsToJson(this);
}
