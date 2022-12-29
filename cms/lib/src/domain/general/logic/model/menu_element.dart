import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'menu_element.g.dart';

typedef RouteChecker = bool Function(String route);

@CopyWith()
@JsonSerializable()
class MenuElement extends Equatable {
  const MenuElement({
    required this.title,
    required this.url,
    this.aliases = const [],
  });

  factory MenuElement.fromJson(dynamic json) => _$MenuElementFromJson(castToJson(json));

  factory MenuElement.empty() => const MenuElement(title: '', url: '');

  final String title;
  final String url;
  final List<String> aliases;

  Json toJson() => _$MenuElementToJson(this);

  @override
  List<Object?> get props => [
        title,
        url,
        aliases,
      ];
}
