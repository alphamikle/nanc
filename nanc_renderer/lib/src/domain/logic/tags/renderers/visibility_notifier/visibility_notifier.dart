import 'dart:async';

import 'package:flutter/material.dart';

class VisibilityNotifier extends StatefulWidget {
  const VisibilityNotifier({
    required this.child,
    required this.onShow,
    required this.onHide,
    required this.lifetime,
    super.key,
  });

  final Widget child;
  final VoidCallback? onShow;
  final VoidCallback? onHide;
  final ValueChanged<int>? lifetime;

  @override
  State<VisibilityNotifier> createState() => _VisibilityNotifierState();
}

class _VisibilityNotifierState extends State<VisibilityNotifier> {
  late final Stopwatch stopWatch = Stopwatch();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      widget.onShow?.call();
      stopWatch.start();
    });
  }

  @override
  void dispose() {
    unawaited(Future.delayed(const Duration(milliseconds: 50), () => widget.onHide).then((VoidCallback? onHide) => onHide?.call()));
    unawaited(
      Future.delayed(const Duration(milliseconds: 50), () => (stopWatch, widget.lifetime)).then(
        ((Stopwatch stopwatch, ValueChanged<int>? lifetime) arguments) {
          if (arguments.$2 != null) {
            final int elapsedMs = arguments.$1.elapsedMilliseconds;
            arguments.$1.stop();
            arguments.$1.reset();
            arguments.$2!(elapsedMs);
          }
        },
      ),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
