import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'key_argument.g.dart';

@JsonSerializable()
class KeyArgument {
  const KeyArgument({
    required this.key,
  });

  factory KeyArgument.fromJson(dynamic json) => _$KeyArgumentFromJson(castToJson(json));

  final String? key;

  Json toJson() => _$KeyArgumentToJson(this);
}
