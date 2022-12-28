import 'package:cms/src/domain/editor/logic/bloc/editor/editor_state.dart';
import 'package:cms/src/domain/general/logic/model/menu_element.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'manual_state.g.dart';

@CopyWith()
@JsonSerializable()
class ManualState extends EditorState {
  const ManualState({
    required super.isLoading,
    required super.markdownContent,
    required this.activeElement,
    required super.isSyncedWithFile,
  });

  factory ManualState.fromJson(dynamic json) => _$ManualStateFromJson(castToJson(json));

  factory ManualState.empty() => ManualState(isLoading: false, markdownContent: '', activeElement: MenuElement.empty(), isSyncedWithFile: false);

  final MenuElement activeElement;

  @override
  List<Object?> get props => [
        ...super.props,
        activeElement,
      ];

  @override
  Json toJson() => _$ManualStateToJson(this);
}
