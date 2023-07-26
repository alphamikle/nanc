import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'visibility_notifier_arguments.g.dart';

@JsonSerializable()
class VisibilityNotifierArguments {
  const VisibilityNotifierArguments({
    required this.onShow,
    required this.onHide,
    required this.lifetime,
  });

  factory VisibilityNotifierArguments.fromJson(dynamic json) => _$VisibilityNotifierArgumentsFromJson(castToJson(json));

  final String? onShow;
  final String? onHide;
  final String? lifetime;

  bool get isEmpty {
    return switch ((onShow, onHide, lifetime)) {
      (null, null, null) => true,
      ('', '', '') => true,
      _ => false,
    };
  }

  Json toJson() => _$VisibilityNotifierArgumentsToJson(this);
}
