import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../../properties/alignment/alignment_arguments.dart';

part 'align_arguments.g.dart';

@JsonSerializable()
class AlignArguments extends AlignmentArguments {
  const AlignArguments({
    required super.x,
    required super.y,
    required super.align,
    required this.heightFactor,
    required this.widthFactor,
    required super.key,
  });

  factory AlignArguments.fromJson(dynamic json) => _$AlignArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? heightFactor;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? widthFactor;

  @override
  Json toJson() => _$AlignArgumentsToJson(this);
}
