import 'dart:async';

import 'package:flutter/material.dart';

mixin KitFocusStreamMixin<T extends StatefulWidget> on State<T> {
  final FocusNode focusNode = FocusNode();

  final StreamController<bool> _hasFocusStreamController = StreamController.broadcast();
  late final Stream<bool> focusStream = _hasFocusStreamController.stream;

  void _focusListener() => _hasFocusStreamController.add(focusNode.hasFocus);

  // ignore: avoid_positional_boolean_parameters
  void updateFocus(bool hasFocus) => _hasFocusStreamController.add(hasFocus);

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_focusListener);
  }

  @override
  void dispose() {
    focusNode.removeListener(_focusListener);
    unawaited(_hasFocusStreamController.close());
    super.dispose();
  }
}
