import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'access_info_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AccessInfoDto {
  const AccessInfoDto({
    required this.appName,
    required this.accessToken,
    required this.uuid,
    required this.workspaceId,
  });

  factory AccessInfoDto.fromJson(dynamic json) => _$AccessInfoDtoFromJson(castToJson(json));

  final String appName;

  final String accessToken;

  final int workspaceId;

  @JsonKey(name: 'dtable_uuid')
  final String uuid;

  Json toJson() => _$AccessInfoDtoToJson(this);
}
