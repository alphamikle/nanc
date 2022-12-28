import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_webrtc/src/sea_table/dto/client_dto.dart';
import 'package:tools/tools.dart';

part 'update_client_request_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UpdateClientRequestDto {
  const UpdateClientRequestDto({
    required this.rowId,
    required this.tableName,
    required this.row,
  });

  factory UpdateClientRequestDto.fromJson(dynamic json) => _$UpdateClientRequestDtoFromJson(castToJson(json));

  final String rowId;
  final String tableName;
  final ClientDto row;

  Json toJson() => _$UpdateClientRequestDtoToJson(this);
}
