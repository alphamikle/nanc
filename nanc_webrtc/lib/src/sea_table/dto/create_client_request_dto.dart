import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_webrtc/src/sea_table/dto/client_dto.dart';
import 'package:tools/tools.dart';

part 'create_client_request_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreateClientRequestDto {
  const CreateClientRequestDto({
    required this.tableName,
    required this.row,
  });

  factory CreateClientRequestDto.fromJson(dynamic json) => _$CreateClientRequestDtoFromJson(castToJson(json));

  final String tableName;
  final ClientDto row;

  Json toJson() => _$CreateClientRequestDtoToJson(this);
}
