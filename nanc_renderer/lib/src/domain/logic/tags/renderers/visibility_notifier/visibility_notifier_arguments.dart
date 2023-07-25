import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'visibility_notifier_arguments.g.dart';

@JsonSerializable()
class VisibilityNotifierArguments {
  const VisibilityNotifierArguments({
    required this.onShow,
    required this.onHide,
  });

  factory VisibilityNotifierArguments.fromJson(dynamic json) => _$VisibilityNotifierArgumentsFromJson(castToJson(json));

  final String? onShow;
  final String? onHide;

  bool get isEmpty => (onShow == null && onHide == null) || onShow!.trim().isEmpty && onHide!.trim().isEmpty;

  Json toJson() => _$VisibilityNotifierArgumentsToJson(this);
}
