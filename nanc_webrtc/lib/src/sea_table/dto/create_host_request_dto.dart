import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_webrtc/src/sea_table/dto/host_dto.dart';
import 'package:tools/tools.dart';

part 'create_host_request_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreateHostRequestDto {
  const CreateHostRequestDto({
    required this.tableName,
    required this.row,
  });

  factory CreateHostRequestDto.fromJson(dynamic json) => _$CreateHostRequestDtoFromJson(castToJson(json));

  final String tableName;
  final HostDto row;

  Json toJson() => _$CreateHostRequestDtoToJson(this);
}
