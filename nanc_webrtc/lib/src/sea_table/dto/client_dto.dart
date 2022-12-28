import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_webrtc/src/sea_table/tools/serialization.dart';
import 'package:tools/tools.dart';

part 'client_dto.g.dart';

@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake)
class ClientDto {
  const ClientDto({
    required this.id,
    required this.roomId,
    required this.candidates,
    required this.answer,
    required this.isConnected,
    required this.createdAt,
  });

  factory ClientDto.fromJson(dynamic json) => _$ClientDtoFromJson(castToJson(json));

  final int id;

  final String roomId;

  @JsonKey(fromJson: listOfJsonFromDynamic, toJson: somethingToString)
  final List<Json> candidates;

  @JsonKey(fromJson: jsonFromDynamic, toJson: somethingToString)
  final Json answer;

  @JsonKey(defaultValue: false)
  final bool isConnected;

  final DateTime createdAt;

  Json toJson() {
    final Json json = _$ClientDtoToJson(this);
    if (id < 0) {
      json.remove('id');
    }
    return json;
  }
}
