import 'package:flutter/material.dart';

import '../ui/shadow_builder.dart';

abstract class LocalNotification {
  static Future<void> show(BuildContext context) async {
    overlayEntry = _overlayEntryBuilder();
    Overlay.maybeOf(context)?.insert(overlayEntry!);
  }

  static OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (BuildContext context) {
        return ShadowBuilder(
          onClose: () => stateCache.close(),
          child: AlertDialog(
            alignment: notificationPosition.alignment,
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            elevation: 0,
            content: this,
          ),
        );
      },
    );
  }
}
