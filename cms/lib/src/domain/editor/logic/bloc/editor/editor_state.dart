import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'editor_state.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class EditorState extends Equatable {
  const EditorState({
    required this.isLoading,
    required this.markdownContent,
    required this.isSyncedWithFile,
  });

  factory EditorState.fromJson(dynamic json) => _$EditorStateFromJson(castToJson(json));

  factory EditorState.empty() => const EditorState(isLoading: false, markdownContent: '', isSyncedWithFile: false);

  final bool isLoading;
  final String markdownContent;
  final bool isSyncedWithFile;

  @override
  List<Object?> get props => _$props;

  Json toJson() => _$EditorStateToJson(this);
}
