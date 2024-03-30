import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../key_argument.dart';

part 'spacer_arguments.g.dart';

@JsonSerializable()
class SpacerArguments extends KeyArgument {
  const SpacerArguments({
    required this.flex,
    required super.key,
  });

  factory SpacerArguments.fromJson(dynamic json) => _$SpacerArgumentsFromJson(castToJson(json));

  final int? flex;

  @override
  Json toJson() => _$SpacerArgumentsToJson(this);
}
