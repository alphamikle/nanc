import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../../model/logic/model/model_interface.dart';

abstract interface class IField {
  abstract final String id;
  abstract final String name;
  abstract final bool showInList;
  abstract final bool isRequired;
  abstract final int sort;
  abstract final bool realField;
  abstract final FormFieldValidator<Object>? validator;
  abstract final Object type;

  List<IField> get virtualFields;

  Object description([BuildContext? context]);

  Json toJson();

  IModel toModel();

  Set<String> get defaultValues;

  bool get isEmpty;

  List<Object?> get props;
}
