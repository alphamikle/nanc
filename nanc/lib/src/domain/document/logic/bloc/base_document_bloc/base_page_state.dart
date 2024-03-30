import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'base_page_state.g.dart';

TextControllerMap _controllerMapFromJson(Json? json) => {};

Json _controllerMapToJson(TextControllerMap controllerMap) => <String, dynamic>{};

@autoequal
@CopyWith(copyWithNull: true)
@JsonSerializable()
class BaseDocumentState extends Equatable {
  const BaseDocumentState({
    required this.data,
    required this.initialData,
    required this.isLoading,
    required this.isDeleting,
    required this.isSaving,
    required this.isError,
    required this.controllerMap,
  });

  factory BaseDocumentState.empty() => const BaseDocumentState(
        data: <String, dynamic>{},
        initialData: <String, dynamic>{},
        isLoading: false,
        isDeleting: false,
        isSaving: false,
        isError: false,
        controllerMap: {},
      );

  factory BaseDocumentState.fromJson(dynamic json) => _$BaseDocumentStateFromJson(castToJson(json));

  final Json data;
  final Json initialData;
  final bool isLoading;
  final bool isSaving;
  final bool isError;
  final bool isDeleting;

  @JsonKey(fromJson: _controllerMapFromJson, toJson: _controllerMapToJson)
  final TextControllerMap controllerMap;

  bool get isChanged {
    return const DeepCollectionEquality().equals(data, initialData) == false;
  }

  Json toJson() => _$BaseDocumentStateToJson(this);

  Diff get diff {
    final Diff diff = {};
    for (final MapEntry<FieldId, dynamic> entry in data.entries) {
      diff[entry.key] = isTheSame(entry.value, initialData[entry.key]) == false;
    }
    return diff;
  }

  @override
  List<Object?> get props => _$props;
}
