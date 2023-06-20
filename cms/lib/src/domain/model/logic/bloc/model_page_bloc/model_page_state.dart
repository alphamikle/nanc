import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

part 'model_page_state.g.dart';

@autoequal
@CopyWith()
class ModelPageState extends Equatable {
  const ModelPageState({
    required this.editableModel,
    required this.initialModel,
    required this.controllerMap,
    required this.idWasChanged,
    required this.isSaving,
  });

  factory ModelPageState.empty() => ModelPageState(
        editableModel: Model.empty(),
        initialModel: Model.empty(),
        controllerMap: const <String, TextEditingController>{},
        idWasChanged: false,
        isSaving: false,
      );

  final Model editableModel;
  final Model initialModel;
  final TextControllerMap controllerMap;
  final bool idWasChanged;
  final bool isSaving;

  bool get hasAnyChanges => editableModel != initialModel;
  bool get modelWasSet => editableModel != Model.empty();

  @override
  List<Object?> get props => _$props;
}
