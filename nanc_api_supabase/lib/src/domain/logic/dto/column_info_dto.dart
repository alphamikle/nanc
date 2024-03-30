import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'column_info_dto.g.dart';

@autoequal
@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake)
class ColumnInfoDto extends Equatable {
  const ColumnInfoDto({
    required this.dataType,
    required this.columnName,
    required this.isNullable,
    required this.characterMaximumLength,
  });

  factory ColumnInfoDto.fromJson(dynamic json) => _$ColumnInfoDtoFromJson(castToJson(json));

  final String dataType;
  final String columnName;
  final String isNullable;
  final int? characterMaximumLength;

  bool get isNullableBool => isNullable.toLowerCase() == 'yes';

  @override
  List<Object?> get props => _$props;

  Json toJson() => _$ColumnInfoDtoToJson(this);
}
