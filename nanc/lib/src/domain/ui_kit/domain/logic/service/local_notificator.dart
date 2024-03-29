import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../model/local_notification_enums.dart';
import '../../ui/components/kit_notification/local_notification.dart';
import '../../ui/components/kit_notification/shadow_builder.dart';

typedef NotificationBuilder = LocalNotification Function(GlobalKey<LocalNotificationState> key, AsyncCallback onClose);
typedef NotificationCloseCallback = AsyncCallback;

abstract class LocalNotificator {
  static final Map<String, GlobalKey<LocalNotificationState>> _keys = {};
  static final Map<String, OverlayEntry> _overlays = {};

  static NotificationCloseCallback show(BuildContext context, {required NotificationBuilder builder}) {
    final String notificationId = Ulid().toUuid();
    final OverlayEntry overlayEntry = _overlayEntryBuilder(notificationId, builder);
    _overlays[notificationId] = overlayEntry;
    Overlay.maybeOf(context)?.insert(overlayEntry);
    return () async => _keys[notificationId]?.currentState?.close();
  }

  static OverlayEntry _overlayEntryBuilder(String notificationId, NotificationBuilder builder) {
    final GlobalKey<LocalNotificationState> notificationKey = GlobalKey();
    final GlobalKey<ShadowBuilderState> shadowBuilderKey = GlobalKey();

    _keys[notificationId] = notificationKey;

    final LocalNotification notification = builder(notificationKey, () async {
      if (shadowBuilderKey.currentState == null) {
        await Future<void>.delayed(notificationKey.currentState!.widget.animationDuration);
      }
      await shadowBuilderKey.currentState?.close();
      _closeOverlay(notificationId);
    });

    final bool withShade = notification.shadeBackground;
    final Widget dialog = AlertDialog(
      alignment: notification.notificationPosition.alignment,
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      elevation: 0,
      content: notification,
    );

    return OverlayEntry(
      builder: (BuildContext context) {
        return withShade
            ? ShadowBuilder(
                animationDuration: notification.animationDuration,
                key: shadowBuilderKey,
                onClose: () async => notificationKey.currentState?.close(),
                child: dialog,
              )
            : dialog;
      },
    );
  }

  static void _closeOverlay(String notificationId) {
    _overlays[notificationId]?.remove();
    _overlays.remove(notificationId);
    _keys.remove(notificationId);
  }
}
