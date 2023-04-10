import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:fields/fields.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
import 'package:tools/tools.dart';

import '../../../../general/logic/model/menu_element.dart';
import '../editor/editor_state.dart';

part 'manual_state.g.dart';

TagRenderer _rendererFrom(dynamic _) => TagRenderer.empty();

dynamic _rendererTo(dynamic _) => null;

@autoequal
@CopyWith()
@JsonSerializable()
class ManualState extends EditorState {
  const ManualState({
    required super.isLoading,
    required super.markdownContent,
    required this.activeElement,
    required this.activeTagRenderer,
    required super.isSyncedWithFile,
    required super.contentType,
  });

  factory ManualState.fromJson(dynamic json) => _$ManualStateFromJson(castToJson(json));

  factory ManualState.empty() => ManualState(
        isLoading: false,
        markdownContent: '',
        activeElement: MenuElement.empty(),
        activeTagRenderer: TagRenderer.empty(),
        isSyncedWithFile: false,
        contentType: ScreenContentType.scrollable,
      );

  final MenuElement activeElement;

  @JsonKey(fromJson: _rendererFrom, toJson: _rendererTo)
  final TagRenderer activeTagRenderer;

  @override
  List<Object?> get props => [...super.props, ..._$props];

  @override
  Json toJson() => _$ManualStateToJson(this);
}
