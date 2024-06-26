import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../model/menu_element.dart';

part 'menu_state.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class MenuState extends Equatable {
  const MenuState({
    required this.activeElement,
    required this.elements,
    required this.isLoading,
    required this.activeHeaderSegment,
  });

  factory MenuState.fromJson(dynamic json) => _$MenuStateFromJson(castToJson(json));

  factory MenuState.empty() => MenuState(activeElement: MenuElement.empty(), elements: const [], isLoading: false, activeHeaderSegment: '');

  final MenuElement activeElement;
  final List<MenuElement> elements;
  final bool isLoading;
  final String activeHeaderSegment;

  Json toJson() => _$MenuStateToJson(this);

  @override
  List<Object?> get props => _$props;
}
