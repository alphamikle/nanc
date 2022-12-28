import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_webrtc/src/sea_table/dto/host_dto.dart';
import 'package:tools/tools.dart';

part 'update_host_request_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UpdateHostRequestDto {
  const UpdateHostRequestDto({
    required this.rowId,
    required this.tableName,
    required this.row,
  });

  factory UpdateHostRequestDto.fromJson(dynamic json) => _$UpdateHostRequestDtoFromJson(castToJson(json));

  final String rowId;
  final String tableName;
  final HostDto row;

  Json toJson() => _$UpdateHostRequestDtoToJson(this);
}
