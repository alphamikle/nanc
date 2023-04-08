import 'package:bloc/bloc.dart';
import 'package:fields/fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../../../service/errors/errors.dart';
import '../../../../general/logic/bloc/side_menu/menu_bloc.dart';
import '../../provider/entity_model_provider.dart';
import '../model_list_bloc/model_list_bloc.dart';
import 'model_page_state.dart';

class ModelPageBloc extends Cubit<ModelPageState> {
  ModelPageBloc({
    required this.modelListBloc,
    required this.menuBloc,
    required this.rootKey,
    required this.modelProvider,
  }) : super(ModelPageState.empty());

  final ModelListBloc modelListBloc;
  final MenuBloc menuBloc;
  final RootKey rootKey;
  final ModelProvider modelProvider;

  Future<void> prepareForModelCreation({bool isSoloCreation = false}) async {
    emit(state.copyWith(
      idWasChanged: false,
      editableModel: isSoloCreation ? Model.emptySolo() : Model.empty(),
      initialModel: isSoloCreation ? Model.emptySolo() : Model.empty(),
    ));
    _initControllerMap();
  }

  Future<void> loadModel(String modelId) async {
    final Model? model = modelListBloc.findModelById(modelId) ?? await modelProvider.findModelById(modelId);
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
    emit(state.copyWith(isSaving: true));
    bool confirmed = false;

    if (state.editableModel.codeFirstEntity) {
      confirmed = await confirmAction(
        context: rootKey.currentContext!,
        title: 'Potentially dangerous action',
        subtitle:
            'You are trying to change a pre-loaded model model. After this change the management of the model model will be done through the backend. Are you sure you want to continue?',
      );
    } else {
      confirmed = true;
    }
    if (confirmed) {
      confirmed = await confirmAction(
        context: rootKey.currentContext!,
        title: 'Dangerous action!',
        subtitle: 'You are trying to change the structure of the model model. This can have negative consequences. Are you sure you want to continue?',
      );
    }
    if (confirmed) {
      final Model newModel = await modelProvider.saveModel(oldModel: state.initialModel, newModel: state.editableModel);
      await modelListBloc.reloadDynamicModels();
      await menuBloc.reInitItems();
      emit(state.copyWith(
        editableModel: newModel,
        initialModel: newModel.deepClone(),
        idWasChanged: false,
      ));
      _initControllerMap();
    }
    emit(state.copyWith(isSaving: false));
  }

  Future<void> create() async {
    emit(state.copyWith(isSaving: true));
    final Model newModel = await modelProvider.createModel(state.editableModel);
    await modelListBloc.reloadDynamicModels();
    await menuBloc.reInitItems();
    emit(state.copyWith(
      editableModel: newModel,
      initialModel: newModel.deepClone(),
      idWasChanged: false,
    ));
    _initControllerMap();
    emit(state.copyWith(isSaving: false));
  }

  void moveField({
    required int row,
    required int column,
    required AxisDirection direction,
  }) {
    final List<List<Field>> fieldsRows = [
      ...state.editableModel.fields.map((List<Field> fieldRow) => [...fieldRow]).toList()
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
      ...state.editableModel.fields.map((List<Field> fieldRow) => [...fieldRow]).toList()
    ];
    final List<Field> newCurrentRow = [fieldsRows[row].removeAt(column)];
    fieldsRows.insert(row, newCurrentRow);
    emit(state.copyWith(
      editableModel: state.editableModel.copyWith(
        fields: fieldsRows,
      ),
    ));
  }

  TextEditingController findTextEditingControllerForField(String fieldName) => state.controllerMap[fieldName]!;

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
      throw UnimplementedError('Field $name of model not implementer in model model editor');
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
      ...state.editableModel.fields.map((List<Field> fieldRow) => [...fieldRow]).toList()
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
