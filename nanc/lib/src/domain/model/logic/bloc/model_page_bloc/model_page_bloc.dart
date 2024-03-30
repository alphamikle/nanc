import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../../../../service/errors/errors.dart';
import '../../../../../service/errors/human_exception.dart';
import '../../../../field/logic/fields/field/field.dart';
import '../../../../general/logic/bloc/side_menu/menu_bloc.dart';
import '../../../../ui_kit/domain/ui/components/kit_modal/confirm_modal.dart';
import '../../../../ui_kit/domain/ui/components/kit_modal/select_modal.dart';
import '../../model/logic/model.dart';
import '../../provider/model_provider.dart';
import '../model_list_bloc/model_list_bloc.dart';
import 'model_page_state.dart';

enum DifferentIdsDecision {
  deleteOld,
  leaveOld,
  cancel;

  bool get needToDelete => this == DifferentIdsDecision.deleteOld;
  bool get needToLeave => this == DifferentIdsDecision.leaveOld;
  bool get needToCancel => this == DifferentIdsDecision.cancel;
}

enum ModelEvent {
  saved,
}

class ModelPageBloc extends Cubit<ModelPageState> {
  ModelPageBloc({
    required this.modelCollectionBloc,
    required this.menuBloc,
    required this.rootKey,
    required this.modelProvider,
    required this.eventBus,
  }) : super(ModelPageState.empty());

  final ModelListBloc modelCollectionBloc;
  final MenuBloc menuBloc;
  final RootKey rootKey;
  final ModelProvider modelProvider;
  final EventBus eventBus;

  Future<void> prepareForModelCreation({bool isSoloCreation = false}) async {
    emit(state.copyWith(
      idWasChanged: false,
      editableModel: isSoloCreation ? Model.initialSolo() : Model.initialCollection(),
      initialModel: isSoloCreation ? Model.initialSolo() : Model.initialCollection(),
    ));
    _initControllerMap();
  }

  Future<void> loadModel(String modelId) async {
    final Model? model = modelCollectionBloc.tryToFindModelById(modelId) ?? await modelProvider.findModelById(modelId);
    if (model == null) {
      notFoundModelError(modelId);
    }
    emit(state.copyWith(
      initialModel: model.deepClone(),
      editableModel: model.deepClone(),
    ));
    _initControllerMap();
  }

  Future<void> save() async {
    try {
      emit(state.copyWith(isSaving: true));
      bool confirmed = false;

      if (state.editableModel.codeFirstEntity) {
        confirmed = await confirmAction(
          context: rootKey.currentContext!,
          title: 'Potentially dangerous action',
          subtitle:
              'You are trying to change a pre-loaded Model. After this change the management of the Model will possible only through Nanc UI. Are you sure you want to continue?',
        );
      } else {
        confirmed = true;
      }
      if (confirmed) {
        confirmed = await confirmAction(
          context: rootKey.currentContext!,
          title: 'Dangerous action',
          subtitle: 'You are trying to change the structure of the Model. This can have negative consequences. Are you sure you want to continue?',
        );
      }
      bool needToDeleteOldModel = false;
      if (confirmed && state.initialModel.id != state.editableModel.id) {
        final DifferentIdsDecision decision = await selectAction(
          context: rootKey.currentContext!,
          title: 'Need action',
          subtitle: 'You changed the Model ID. This will create a new Model, with all the additional changes you made to the old Model. What you want to do?',
          values: [
            SelectValue(value: DifferentIdsDecision.cancel, title: 'Cancel', color: rootKey.currentContext!.theme.colorScheme.primary),
            SelectValue(value: DifferentIdsDecision.leaveOld, title: 'Leave old model', color: rootKey.currentContext!.theme.colorScheme.secondary),
            if (state.initialModel.codeFirstEntity == false && state.initialModel.isHybrid == false)
              SelectValue(value: DifferentIdsDecision.deleteOld, title: 'Delete old model', color: rootKey.currentContext!.theme.colorScheme.tertiary),
          ],
        );
        if (decision.needToCancel) {
          emit(state.copyWith(isSaving: false));
          return;
        }
        if (decision.needToDelete) {
          needToDeleteOldModel = true;
        }
      }
      if (confirmed) {
        Model newModel = await modelProvider.saveModel(oldModel: state.initialModel, newModel: state.editableModel, needToDeleteOldModel: needToDeleteOldModel);
        if (state.initialModel.codeFirstEntity) {
          newModel = newModel.copyWith(isHybrid: true);
        }
        await modelCollectionBloc.reloadDynamicModels();
        await menuBloc.reInitItems();
        emit(state.copyWith(
          editableModel: newModel,
          initialModel: newModel.deepClone(),
          idWasChanged: false,
        ));
        _initControllerMap();
      }
      emit(state.copyWith(isSaving: false));
      eventBus.send(eventId: ModelEvent.saved);
    } catch (error, stackTrace) {
      emit(state.copyWith(isSaving: false));
      throw [error, stackTrace].toHumanException('Model saving failed!');
    }
  }

  Future<void> create() async {
    try {
      emit(state.copyWith(isSaving: true));
      final Model newModel = await modelProvider.createModel(state.editableModel);
      await modelCollectionBloc.reloadDynamicModels();
      await menuBloc.reInitItems();
      emit(state.copyWith(
        editableModel: newModel,
        initialModel: newModel.deepClone(),
        idWasChanged: false,
      ));
      _initControllerMap();
      emit(state.copyWith(isSaving: false));
    } catch (error, stackTrace) {
      emit(state.copyWith(isSaving: false));
      throw [error, stackTrace].toHumanException('Model creation failed!');
    }
  }

  Future<bool> delete() async {
    final bool isHybridModel = state.initialModel.isHybrid;
    bool confirmed = await confirmAction(
      context: rootKey.currentContext!,
      title: 'Very dangerous action',
      subtitle:
          'You are about to ${isHybridModel ? 'reset' : 'delete'} a model. This is a very dangerous action that can lead to data corruption as well as other irreversible consequences. Are you sure you want to do this?',
    );
    if (confirmed) {
      confirmed = await confirmAction(
        context: rootKey.currentContext!,
        title: 'It is really very dangerous action',
        subtitle: 'Is that really what you want?',
      );
    }
    if (confirmed) {
      emit(state.copyWith(isDeleting: true));
      try {
        await modelProvider.deleteModel(state.initialModel);
        await modelCollectionBloc.reloadDynamicModels();
        await menuBloc.reInitItems();
        emit(state.copyWith(
          editableModel: Model.empty(),
          idWasChanged: false,
          isSaving: false,
          initialModel: Model.empty(),
          isDeleting: false,
        ));
      } catch (error, stackTrace) {
        emit(state.copyWith(
          editableModel: Model.empty(),
          idWasChanged: false,
          isSaving: false,
          initialModel: Model.empty(),
          isDeleting: false,
        ));
        throw [error, stackTrace].toHumanException('Error on deleting model ${state.initialModel.name}');
      }
      return true;
    }
    return false;
  }

  void moveField({
    required int row,
    required int column,
    required AxisDirection direction,
  }) {
    final List<List<Field>> fieldsRows = [
      ...state.editableModel.fields.map((List<Field> fieldRow) => [...fieldRow])
    ];
    final Field currentField = fieldsRows[row][column];

    if (direction == AxisDirection.left) {
      fieldsRows[row][column] = fieldsRows[row][column - 1];
      fieldsRows[row][column - 1] = currentField;
    } else if (direction == AxisDirection.up) {
      fieldsRows[row - 1].add(currentField);
      fieldsRows[row].removeAt(column);
      if (fieldsRows[row].isEmpty) {
        fieldsRows.removeAt(row);
      }
    } else if (direction == AxisDirection.right) {
      fieldsRows[row][column] = fieldsRows[row][column + 1];
      fieldsRows[row][column + 1] = currentField;
    } else if (direction == AxisDirection.down) {
      if (fieldsRows.length - 1 == row) {
        fieldsRows.add([]);
      }
      fieldsRows[row + 1].add(currentField);
      fieldsRows[row].removeAt(column);
      if (fieldsRows[row].isEmpty) {
        fieldsRows.removeAt(row);
      }
    }
    emit(state.copyWith(
      editableModel: state.editableModel.copyWith(
        fields: fieldsRows,
      ),
    ));
  }

  void expandField({
    required int row,
    required int column,
  }) {
    final List<List<Field>> fieldsRows = [
      ...state.editableModel.fields.map((List<Field> fieldRow) => [...fieldRow])
    ];
    final List<Field> newCurrentRow = [fieldsRows[row].removeAt(column)];
    fieldsRows.insert(row, newCurrentRow);
    emit(state.copyWith(
      editableModel: state.editableModel.copyWith(
        fields: fieldsRows,
      ),
    ));
  }

  TextEditingController findTextEditingControllerForField(String fieldName) {
    final TextEditingController? controller = state.controllerMap[fieldName];
    if (controller == null) {
      _initControllerMap();
    }
    return state.controllerMap[fieldName]!;
  }

  void updateModelProperty(String name, dynamic value) {
    final Model model = state.editableModel;

    if (name == Model.idPropertyName) {
      emit(state.copyWith(
        editableModel: model.copyWith(id: cast<String>(value)),
        idWasChanged: true,
      ));
    } else if (name == Model.namePropertyName) {
      final String name = cast<String>(value);
      if (state.idWasChanged) {
        emit(state.copyWith.editableModel(model.copyWith(
          name: name,
        )));
      } else {
        final String autoIdValue = toSnakeCase(cast<String>(value));
        state.controllerMap[Model.idPropertyName]!.text = autoIdValue;
        emit(state.copyWith(
          editableModel: model.copyWith(
            id: autoIdValue,
            name: name,
          ),
        ));
      }
    } else if (name == Model.iconPropertyName) {
      emit(state.copyWith.editableModel(model.copyWith(
        icon: cast<String>(value),
      )));
    } else if (name == Model.isCollectionPropertyName) {
      emit(state.copyWith.editableModel(model.copyWith(
        isCollection: cast<bool>(value),
      )));
    } else if (name == Model.sortPropertyName) {
      emit(state.copyWith.editableModel(model.copyWith(
        sort: cast<int>(value),
      )));
    } else if (name == Model.showInMenuPropertyName) {
      emit(state.copyWith.editableModel(model.copyWith(
        showInMenu: cast<bool>(value),
      )));
    } else {
      throw UnimplementedError('Field $name of model is not implemented in model editor');
    }
  }

  void updateModelField({required int row, required int column, required Field field}) {
    final List<List<Field>> fields = state.editableModel.fields.map((List<Field> rowFields) => [...rowFields]).toList();
    fields[row][column] = field;
    emit(
      state.copyWith.editableModel(
        state.editableModel.copyWith(
          fields: fields,
        ),
      ),
    );
  }

  void addModelField(Field newField, int rowIndex) {
    final List<List<Field>> fieldsRows = [...state.editableModel.fields];
    if (fieldsRows.length == rowIndex) {
      fieldsRows.add([newField]);
    } else {
      fieldsRows[rowIndex] = [...fieldsRows[rowIndex], newField];
    }
    emit(state.copyWith(
      editableModel: state.editableModel.copyWith(
        fields: fieldsRows,
      ),
    ));
  }

  Future<void> deleteModelField(int row, int column) async {
    final List<List<Field>> fieldsRows = [
      ...state.editableModel.fields.map((List<Field> fieldRow) => [...fieldRow])
    ];
    final List<Field> currentRow = fieldsRows[row];
    final Field currentField = currentRow[column];

    if (await confirmAction(context: rootKey.currentContext!, title: 'Are you sure, that you want to delete "${currentField.name}"?')) {
      currentRow.removeAt(column);
      if (currentRow.isEmpty) {
        fieldsRows.removeAt(row);
      }

      emit(state.copyWith(
        editableModel: state.editableModel.copyWith(
          fields: fieldsRows,
        ),
      ));
    }
  }

  void _initControllerMap() {
    final Model model = state.editableModel;
    final TextControllerMap controllerMap = {
      Model.idPropertyName: TextEditingController(text: model.id),
      Model.namePropertyName: TextEditingController(text: model.name),
      Model.iconPropertyName: TextEditingController(text: model.icon),
      Model.isCollectionPropertyName: TextEditingController(text: model.isCollection.toString()),
      Model.sortPropertyName: TextEditingController(text: model.sort.toString()),
      Model.showInMenuPropertyName: TextEditingController(text: model.showInMenu.toString()),
    };
    emit(state.copyWith.controllerMap(controllerMap));
  }
}
