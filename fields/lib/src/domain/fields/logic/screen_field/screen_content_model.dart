import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'screen_content_model.g.dart';

enum ScreenContentType {
  scrollable,
  freeform,
}

const String _fieldType = 'screenContent';

String _fieldTypeToJson(dynamic _) => _fieldType;

String _fieldTypeFromJson(dynamic _) => _fieldType;

@CopyWith()
@JsonSerializable()
class ScreenContentModel {
  const ScreenContentModel({
    required this.content,
    required this.contentType,
    this.fieldType = _fieldType,
  });

  factory ScreenContentModel.fromJson(dynamic json) => _$ScreenContentModelFromJson(castToJson(json));

  final String content;
  final ScreenContentType contentType;

  @JsonKey(toJson: _fieldTypeToJson, fromJson: _fieldTypeFromJson)
  final String fieldType;

  Json toJson() => _$ScreenContentModelToJson(this);
}
