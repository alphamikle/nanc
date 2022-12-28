import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'message.g.dart';

@CopyWith()
@JsonSerializable()
class Message {
  const Message({
    required this.messageType,
    required this.messageId,
    required this.payload,
    this.isError = false,
    this.isResponse = false,
  });

  factory Message.fromJson(dynamic json) => _$MessageFromJson(castToJson(json));

  final String messageType;
  final String messageId;
  final Object? payload;
  final bool isError;
  final bool isResponse;

  bool get hasPayload => payload != null;

  Message get response => copyWith(isResponse: true);

  Json toJson() => _$MessageToJson(this);

  @override
  String toString() => prettyJson(toJson());
}
