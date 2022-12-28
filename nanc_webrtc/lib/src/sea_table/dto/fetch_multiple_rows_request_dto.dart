import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'fetch_multiple_rows_request_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FetchMultipleRowsRequestDto {
  const FetchMultipleRowsRequestDto({
    required this.sql,
    this.convertKeys = true,
  });

  factory FetchMultipleRowsRequestDto.fromJson(dynamic json) => _$FetchMultipleRowsRequestDtoFromJson(castToJson(json));

  final String sql;
  final bool convertKeys;

  Json toJson() => _$FetchMultipleRowsRequestDtoToJson(this);
}
