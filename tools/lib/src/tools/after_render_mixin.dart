import 'package:flutter/material.dart';

mixin AfterRender<T extends StatefulWidget> on State<T> {
  Future<void> afterRender() async {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await afterRender();
    });
  }
}
