import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/alignment/alignment_arguments.dart';
import 'package:tools/tools.dart';

part 'align_arguments.g.dart';

@JsonSerializable()
class AlignArguments extends AlignmentArguments {
  const AlignArguments({
    required super.x,
    required super.y,
    required super.align,
    required this.heightFactor,
    required this.widthFactor,
  });

  factory AlignArguments.fromJson(dynamic json) => _$AlignArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? heightFactor;

  @JsonKey(fromJson: nullableDoubleFromJson)
  final double? widthFactor;

  @override
  Json toJson() => _$AlignArgumentsToJson(this);
}
