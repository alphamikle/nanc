import 'package:autoequal/autoequal.dart';
import 'package:config/config.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../../../../model/logic/model/logic/model.dart';

part 'collection_filter_state.g.dart';

@autoequal
@CopyWith(copyWithNull: true)
@JsonSerializable()
class CollectionFilterState extends Equatable {
  const CollectionFilterState({
    required this.collectionModel,
    required this.query,
    required this.backup,
  });

  factory CollectionFilterState.fromJson(dynamic json) => _$CollectionFilterStateFromJson(castToJson(json));

  factory CollectionFilterState.empty() => CollectionFilterState(collectionModel: Model.empty(), query: null, backup: const {});

  final Model collectionModel;

  final Map<ModelId, Json> backup;

  @JsonKey(fromJson: queryFieldFromJson, toJson: queryFieldToJson)
  final QueryField? query;

  @override
  List<Object?> get props => _$props;

  Json toJson() => _$CollectionFilterStateToJson(this);
}
