import 'package:cms/cms.dart';
import 'package:fields/src/domain/fields/logic/field/field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FieldCellWidget<F extends Field> extends StatefulWidget {
  const FieldCellWidget({
    required this.field,
    required this.creationMode,
    super.key,
  });

  final F field;
  final bool creationMode;
}

mixin FieldCellHelper<F extends Field, T extends FieldCellWidget<F>> on State<T> {
  F get field => widget.field;
  String get fieldId => widget.field.id;
  late final BasePageBloc pageBloc = context.read();
  TextEditingController get controller => pageBloc.controllerFor(widget.field.id);
  String get helper => '${field.name}${isRequired ? ' (required)' : ''}';
  bool get creationMode => widget.creationMode;
  bool get isRequired => field.isRequired;
}
