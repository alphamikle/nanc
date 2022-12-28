import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'delete_rows_request_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DeleteRowsRequestDto {
  const DeleteRowsRequestDto({
    required this.tableName,
    required this.rowIds,
  });

  factory DeleteRowsRequestDto.fromJson(dynamic json) => _$DeleteRowsRequestDtoFromJson(castToJson(json));

  final String tableName;
  final List<String> rowIds;

  Json toJson() => _$DeleteRowsRequestDtoToJson(this);
}
