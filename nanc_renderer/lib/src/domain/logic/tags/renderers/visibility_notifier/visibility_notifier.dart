import 'package:flutter/material.dart';

class VisibilityNotifier extends StatefulWidget {
  const VisibilityNotifier({
    required this.child,
    required this.onShow,
    required this.onHide,
    super.key,
  });

  final Widget child;
  final VoidCallback? onShow;
  final VoidCallback? onHide;

  @override
  State<VisibilityNotifier> createState() => _VisibilityNotifierState();
}

class _VisibilityNotifierState extends State<VisibilityNotifier> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      widget.onShow?.call();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      widget.onHide?.call();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
