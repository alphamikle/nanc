import 'dart:async';

import 'package:flutter/cupertino.dart';

class FieldController {
  factory FieldController() {
    final TextEditingController controller = TextEditingController();

    /// ? This sinks already closed at the [FieldController.dispose] method
    // ignore: close_sinks
    final StreamController<String> errorController = StreamController.broadcast();
    // ignore: close_sinks
    final StreamController<bool> completenessController = StreamController.broadcast();

    return FieldController._(controller, errorController, completenessController);
  }

  FieldController._(this._controller, this._errorController, this._completenessController);

  final TextEditingController _controller;
  final StreamController<String> _errorController;
  final StreamController<bool> _completenessController;

  Stream<String> get errorsStream => _errorController.stream;
  Stream<bool> get completenessStream => _completenessController.stream;
  String get text => _controller.text;
  TextEditingValue get value => _controller.value;
  set value(TextEditingValue value) => _controller.value = value;

  Future<void> dispose() async {
    await _errorController.close();
    await _completenessController.close();
  }
}
