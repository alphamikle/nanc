import 'package:flutter/material.dart';

mixin AfterRender<T extends StatefulWidget> on State<T> {
  Future<void> afterRender();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await afterRender();
    });
  }
}
