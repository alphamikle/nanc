import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'carousel_slider_arguments.g.dart';

@JsonSerializable()
class ReviewsSliderArguments {
  const ReviewsSliderArguments({
    required this.height,
  });

  factory ReviewsSliderArguments.fromJson(dynamic json) => _$ReviewsSliderArgumentsFromJson(castToJson(json));

  @JsonKey(fromJson: doubleOrNullFromJson)
  final double? height;

  Json toJson() => _$ReviewsSliderArgumentsToJson(this);
}
