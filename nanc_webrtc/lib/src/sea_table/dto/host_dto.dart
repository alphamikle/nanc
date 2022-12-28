import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_webrtc/src/sea_table/tools/serialization.dart';
import 'package:tools/tools.dart';

part 'host_dto.g.dart';

@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake)
class HostDto {
  const HostDto({
    required this.id,
    required this.roomId,
    required this.offer,
    required this.candidates,
    required this.hasConnectedClients,
    required this.createdAt,
  });

  factory HostDto.fromJson(dynamic json) => _$HostDtoFromJson(castToJson(json));

  final int id;

  final String roomId;

  @JsonKey(fromJson: jsonFromDynamic, toJson: somethingToString)
  final Json offer;

  @JsonKey(fromJson: listOfJsonFromDynamic, toJson: somethingToString)
  final List<Json> candidates;

  @JsonKey(defaultValue: false)
  final bool hasConnectedClients;

  final DateTime createdAt;

  Json toJson() {
    final Json json = _$HostDtoToJson(this);
    if (id < 0) {
      json.remove('id');
    }
    return json;
  }
}
