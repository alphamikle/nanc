import 'package:cms/cms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../fields.dart';

mixin FieldCell<F extends Field> on Widget {
  F get field;
  bool get creationMode;
}

class ErrorFieldCell extends StatelessWidget {
  const ErrorFieldCell({
    required this.warning,
    super.key,
  });

  final String warning;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: Colors.red,
      child: Center(
        child: Text(warning),
      ),
    );
  }
}

abstract class FieldCellWidget<F extends Field> extends StatefulWidget with FieldCell<F> {
  const FieldCellWidget({
    required this.field,
    required this.creationMode,
    super.key,
  });

  @override
  final F field;

  @override
  final bool creationMode;
}

mixin FieldCellHelper<F extends Field, T extends FieldCellWidget<F>> on State<T> {
  F get field => widget.field;
  String get fieldId => widget.field.id;
  late final BaseDocumentBloc pageBloc = context.read();
  Object? currentValue() => pageBloc.valueForKey(fieldId);
  TextEditingController get controller => pageBloc.controllerFor(widget.field.id);
  String get helper => '${field.name}${isRequired ? ' (required)' : ''}';
  bool get creationMode => widget.creationMode;
  bool get isRequired => field.isRequired;
}
