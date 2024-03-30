import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'params_dto.g.dart';

enum Order {
  asc,
  desc;

  bool get isAsc => this == Order.asc;
  bool get isDesc => this == Order.desc;
}

@autoequal
@CopyWith()
@JsonSerializable()
class ParamsDto extends Equatable {
  const ParamsDto({
    required this.page,
    required this.limit,
    required this.sort,
  });

  final int page;
  final int limit;
  final Sort sort;

  @override
  List<Object?> get props => _$props;

  Json toJson() => _$ParamsDtoToJson(this);
}

@autoequal
@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake)
class Sort extends Equatable {
  const Sort({
    required this.fieldId,
    required this.order,
  });

  factory Sort.fromJson(Json json) => _$SortFromJson(json);

  final String fieldId;
  final Order order;

  @override
  List<Object?> get props => _$props;

  Json toJson() => _$SortToJson(this);
}
