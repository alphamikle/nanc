import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension ExtendedStateExtension on State<StatefulWidget> {
  @protected
  void safeSetState([VoidCallback? callback]) {
    if (mounted) {
      // ignore: invalid_use_of_protected_member
      setState(callback ?? () {});
    }
  }

  T read<T>() => context.read<T>();

  T? safeRead<T>() {
    if (mounted) {
      return read<T>();
    }
    return null;
  }
}
