import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'show_arguments.g.dart';

@JsonSerializable()
class IfArguments {
  const IfArguments({
    required this.show,
    required this.notShow,
  });

  factory IfArguments.fromJson(dynamic json) => _$IfArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: boolOrNullFromJson)
  final bool? show;

  @JsonKey(fromJson: boolOrNullFromJson)
  final bool? notShow;

  Json toJson() => _$IfArgumentsToJson(this);
}
