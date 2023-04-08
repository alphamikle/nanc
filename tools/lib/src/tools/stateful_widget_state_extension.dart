import 'package:flutter/material.dart';

extension ExtendedStateExtension on State<StatefulWidget> {
  @protected
  void safeSetState(VoidCallback callback) {
    final State<StatefulWidget> self = this;

    if (mounted) {
      // ignore: invalid_use_of_protected_member
      self.setState(callback);
    }
  }
}
