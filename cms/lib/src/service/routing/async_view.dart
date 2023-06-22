import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AsyncView extends StatelessWidget {
  const AsyncView({
    required this.child,
    this.callback,
    this.loader,
    super.key,
  });

  final AsyncCallback? callback;
  final Widget child;
  final Widget? loader;

  @override
  Widget build(BuildContext context) {
    if (callback == null) {
      return child;
    }

    return FutureBuilder(
      future: callback!.call(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return child;
        }
        return loader ?? const KitCenteredText(text: 'Loading');
      },
    );
  }
}
