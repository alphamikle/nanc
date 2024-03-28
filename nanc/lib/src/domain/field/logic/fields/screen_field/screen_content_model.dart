import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'screen_content_model.g.dart';

enum ScreenContentType {
  scrollable,
  stack;

  bool get isScrollable => this == ScreenContentType.scrollable;
  bool get isStack => this == ScreenContentType.stack;
}

@CopyWith()
@JsonSerializable()
class ScreenContentModel {
  const ScreenContentModel({
    required this.content,
    required this.contentType,
  });

  factory ScreenContentModel.fromJson(dynamic json) => _$ScreenContentModelFromJson(castToJson(json));

  final String content;
  final ScreenContentType contentType;

  Json toJson() => _$ScreenContentModelToJson(this);
}
