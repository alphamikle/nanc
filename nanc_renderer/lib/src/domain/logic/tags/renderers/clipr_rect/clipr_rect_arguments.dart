import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../../properties/border_radius/border_radius_arguments.dart';

part 'clipr_rect_arguments.g.dart';

@JsonSerializable()
class ClipRRectArguments extends BorderRadiusArguments {
  ClipRRectArguments({
    required super.topLeft,
    required super.topRight,
    required super.bottomRight,
    required super.bottomLeft,
    required super.all,
    required super.key,
  });

  factory ClipRRectArguments.fromJson(dynamic json) => _$ClipRRectArgumentsFromJson(castToJson(json));

  @override
  Json toJson() => _$ClipRRectArgumentsToJson(this);
}
