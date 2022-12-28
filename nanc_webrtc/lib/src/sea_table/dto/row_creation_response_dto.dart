import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_webrtc/src/sea_table/tools/serialization.dart';
import 'package:tools/tools.dart';

part 'row_creation_response_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RowCreationResponseDto {
  const RowCreationResponseDto({
    required this.id,
  });

  factory RowCreationResponseDto.fromJson(dynamic json) => _$RowCreationResponseDtoFromJson(castToJson(json));

  @JsonKey(name: rowIdField)
  final String id;

  Json toJson() => _$RowCreationResponseDtoToJson(this);
}
