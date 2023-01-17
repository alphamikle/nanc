import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'center_arguments.g.dart';

@JsonSerializable()
class CenterArguments {
  const CenterArguments({
    required this.heightFactor,
    required this.widthFactor,
  });

  factory CenterArguments.fromJson(dynamic json) => _$CenterArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? heightFactor;

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? widthFactor;

  Json toJson() => _$CenterArgumentsToJson(this);
}
