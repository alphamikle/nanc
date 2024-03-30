import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'slot_arguments.g.dart';

@JsonSerializable()
class SlotArguments {
  const SlotArguments({
    required this.name,
  });

  factory SlotArguments.fromJson(dynamic json) => _$SlotArgumentsFromJson(castToJson(json));

  final String? name;

  Json toJson() => _$SlotArgumentsToJson(this);
}
