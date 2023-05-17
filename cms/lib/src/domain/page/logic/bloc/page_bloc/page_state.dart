import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';

import '../base_entity_page_bloc/base_page_state.dart';

part 'page_state.g.dart';

TextControllerMap _controllerMapFromJson(Json? json) => {};

Json _controllerMapToJson(TextControllerMap controllerMap) => <String, dynamic>{};

typedef ModelId = String;

/// ? ModelId - it is the ID of the relationships model, such as "user_to_bool_rel" an etc.
typedef ThirdTableData = Map<ModelId, Map<ParentEntityDataId, List<ChildEntityDataId>>>;

@autoequal
@CopyWith()
@JsonSerializable()
class PageState extends BaseEntityPageState {
  const PageState({
    required super.data,
    required super.initialData,
    required super.isLoading,
    required super.isDeleting,
    required super.isSaving,
    required super.controllerMap,
    required this.thirdTable,
    required this.thirdTableData,
  });

  factory PageState.optional({
    Json? data,
    Json? initialData,
    bool? isLoading,
    bool? isDeleting,
    bool? isSaving,
    TextControllerMap? controllerMap,
    Map<ModelId, ThirdTable>? thirdTable,
    ThirdTableData? thirdTableData,
  }) {
    return PageState(
      data: data ?? <String, dynamic>{},
      initialData: initialData ?? <String, dynamic>{},
      isLoading: isLoading ?? false,
      isDeleting: isDeleting ?? false,
      isSaving: isSaving ?? false,
      controllerMap: controllerMap ?? {},
      thirdTable: thirdTable ?? {},
      thirdTableData: const <ModelId, Map<ParentEntityDataId, List<ChildEntityDataId>>>{},
    );
  }

  factory PageState.empty() => const PageState(
        data: <String, dynamic>{},
        initialData: <String, dynamic>{},
        thirdTableData: <ModelId, Map<ParentEntityDataId, List<ChildEntityDataId>>>{},
        isLoading: false,
        isDeleting: false,
        isSaving: false,
        controllerMap: {},
        thirdTable: {},
      );

  factory PageState.fromJson(dynamic json) => _$PageStateFromJson(castToJson(json));

  final ThirdTableData thirdTableData;
  final Map<ModelId, ThirdTable> thirdTable;

  @override
  bool get isChanged {
    return super.isChanged || thirdTableData.isNotEmpty;
  }

  @override
  Json toJson() => _$PageStateToJson(this);

  @override
  List<Object?> get props => [...super.props, ..._$props];
}
