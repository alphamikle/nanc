import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../domain/ui_kit/domain/ui/components/kit_preloader_v3.dart';

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
        return loader ?? const KitPreloaderV3.center();
      },
    );
  }
}
