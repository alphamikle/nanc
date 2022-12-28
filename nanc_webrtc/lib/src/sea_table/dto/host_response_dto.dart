import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_webrtc/src/sea_table/dto/host_dto.dart';
import 'package:tools/tools.dart';

part 'host_response_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HostResponseDto {
  const HostResponseDto({
    required this.success,
    required this.results,
  });

  factory HostResponseDto.fromJson(dynamic json) => _$HostResponseDtoFromJson(castToJson(json));

  final bool success;
  final List<HostDto> results;

  Json toJson() => _$HostResponseDtoToJson(this);
}
