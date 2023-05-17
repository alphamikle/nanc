import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

part 'third_table.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class ThirdTable extends Equatable {
  const ThirdTable({
    required this.relationsEntity,
    required this.parentEntityIdName,
    required this.childEntityIdName,
  });

  factory ThirdTable.empty() => ThirdTable(relationsEntity: Model.empty(), parentEntityIdName: '', childEntityIdName: '');

  factory ThirdTable.fromJson(dynamic json) => _$ThirdTableFromJson(castToJson(json));

  final Model relationsEntity;
  final String parentEntityIdName;
  final String childEntityIdName;

  Json toJson() => _$ThirdTableToJson(this);

  @override
  List<Object?> get props => _$props;
}
