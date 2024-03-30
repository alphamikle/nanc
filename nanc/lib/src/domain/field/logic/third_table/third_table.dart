import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:tools/tools.dart';

import '../../../model/logic/model/logic/model.dart';

part 'third_table.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class ThirdTable extends Equatable implements IThirdTable {
  const ThirdTable({
    required this.relationsEntity,
    required this.parentEntityIdName,
    required this.childEntityIdName,
  });

  factory ThirdTable.empty() => ThirdTable(relationsEntity: Model.empty(), parentEntityIdName: '', childEntityIdName: '');

  factory ThirdTable.fromJson(dynamic json) => _$ThirdTableFromJson(castToJson(json));

  @override
  final Model relationsEntity;

  @override
  final String parentEntityIdName;

  @override
  final String childEntityIdName;

  @override
  Json toJson() => _$ThirdTableToJson(this);

  @override
  List<Object?> get props => _$props;
}
