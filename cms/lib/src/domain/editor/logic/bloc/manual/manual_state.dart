import 'package:cms/src/domain/editor/logic/bloc/editor/editor_state.dart';
import 'package:cms/src/domain/general/logic/model/menu_element.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rich_renderer/rich_renderer.dart';
import 'package:tools/tools.dart';

part 'manual_state.g.dart';

TagRenderer _rendererFrom(dynamic _) => TagRenderer.empty();

dynamic _rendererTo(dynamic _) => null;

@CopyWith()
@JsonSerializable()
class ManualState extends EditorState {
  const ManualState({
    required super.isLoading,
    required super.markdownContent,
    required this.activeElement,
    required this.activeTagRenderer,
    required super.isSyncedWithFile,
  });

  factory ManualState.fromJson(dynamic json) => _$ManualStateFromJson(castToJson(json));

  factory ManualState.empty() => ManualState(
        isLoading: false,
        markdownContent: '',
        activeElement: MenuElement.empty(),
        activeTagRenderer: TagRenderer.empty(),
        isSyncedWithFile: false,
      );

  final MenuElement activeElement;

  @JsonKey(fromJson: _rendererFrom, toJson: _rendererTo)
  final TagRenderer activeTagRenderer;

  @override
  List<Object?> get props => [
        ...super.props,
        activeElement,
        activeTagRenderer,
      ];

  @override
  Json toJson() => _$ManualStateToJson(this);
}
