import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_webrtc/src/sea_table/dto/client_dto.dart';
import 'package:tools/tools.dart';

part 'clients_response_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ClientsResponseDto {
  const ClientsResponseDto({
    required this.success,
    required this.results,
  });

  factory ClientsResponseDto.fromJson(dynamic json) => _$ClientsResponseDtoFromJson(castToJson(json));

  final bool success;
  final List<ClientDto> results;

  Json toJson() => _$ClientsResponseDtoToJson(this);
}
