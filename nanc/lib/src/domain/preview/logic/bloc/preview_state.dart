import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:fields/fields.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'preview_state.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class PreviewState extends Equatable {
  const PreviewState({
    required this.isLoading,
    required this.xmlContent,
    required this.contentType,
    required this.asyncMode,
  });

  factory PreviewState.empty() => const PreviewState(
        isLoading: false,
        xmlContent: '',
        contentType: ScreenContentType.scrollable,
        asyncMode: false,
      );

  factory PreviewState.fromJson(dynamic json) => _$PreviewStateFromJson(castToJson(json));

  final bool isLoading;
  final String xmlContent;
  final ScreenContentType contentType;
  final bool asyncMode;

  Json toJson() => _$PreviewStateToJson(this);

  @override
  List<Object?> get props => _$props;
}
