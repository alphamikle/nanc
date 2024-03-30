import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nanc_tools/nanc_tools.dart';
import 'package:rive/rive.dart';

import '../tools/assets_loader.dart';

mixin RiveStateMachine<T extends StatefulWidget, I> on State<T> {
  late final Artboard artBoard;
  late final StateMachineController stateMachineController;
  bool initialized = false;
  final Completer<bool> _initCompleter = Completer();
  Future<bool> get initializedFuture => _initCompleter.future;

  String get filePath;
  String get stateMachine;
  String get stateMachineInputName;
  I get stateMachineInitialValue;

  SMIInput<I>? stateMachineInput;

  Future<void> init() async {
    final ByteData data = await rootBundle.load(prepareAssetPath(filePath));
    final RiveFile file = RiveFile.import(data);
    artBoard = file.mainArtboard;
    final StateMachineController? controller = StateMachineController.fromArtboard(artBoard, stateMachine);
    if (controller != null) {
      this.stateMachineController = controller;
      artBoard.addController(controller);
      stateMachineInput = controller.findInput(stateMachineInputName);
      stateMachineInput?.value = stateMachineInitialValue;
    }
    initialized = true;
    _initCompleter.complete(true);
    safeSetState();
  }

  @override
  void initState() {
    super.initState();
    unawaited(init());
  }

  @override
  void dispose() {
    stateMachineController.dispose();
    super.dispose();
  }
}
