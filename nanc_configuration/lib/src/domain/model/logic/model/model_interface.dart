import 'package:nanc_tools/nanc_tools.dart';

import '../../../field/logic/model/field_interface.dart';
import '../../../field/logic/model/id_field_interface.dart';

abstract interface class IModel {
  abstract final String id;
  abstract final String name;
  abstract final String icon;
  abstract final bool isCollection;
  abstract final int sort;
  abstract final bool showInMenu;
  abstract final List<List<IField>> fields;
  abstract final bool codeFirstEntity;
  abstract final bool isHybrid;
  abstract final List<IField> flattenFields;
  abstract final List<IField> listFields;
  abstract final IIdField idField;
  abstract final List<String> dynamicFields;

  IField? fieldById(String fieldId);

  Json createEmptyData();

  Json toJson();

  IModel deepClone();

  List<Object?> get props;
}
