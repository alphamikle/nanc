import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'params_dto.g.dart';

enum Order {
  asc,
  desc,
}

@JsonSerializable()
class ParamsDto {
  const ParamsDto({
    required this.page,
    required this.limit,
    required this.sort,
  });

  const ParamsDto.initial()
      : page = 1,
        limit = 50,
        sort = const Sort(field: 'id', order: Order.asc);

  Json toJson() => _$ParamsDtoToJson(this);

  final int page;
  final int limit;
  final Sort sort;
}

@JsonSerializable()
class Sort {
  const Sort({
    required this.field,
    required this.order,
  });

  factory Sort.fromJson(Json json) => _$SortFromJson(json);

  final String field;
  final Order order;

  Json toJson() => _$SortToJson(this);
}
