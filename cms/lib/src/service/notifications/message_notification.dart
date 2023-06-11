import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:local_notifications/local_notifications.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

void showMessageNotification(BuildContext context, String message) {
  LocalNotificator.show(
    context,
    builder: (GlobalKey<LocalNotificationState> key, AsyncCallback onClose) => LocalNotification(
      onClose: onClose,
      key: key,
      animation: AnimationType.fromBottom,
      width: 300,
      animationDuration: const Duration(milliseconds: 750),
      notificationPosition: NotificationPosition.bottomLeft,
      toastDuration: const Duration(seconds: 10),
      closeButtonBuilder: (VoidCallback onClose) => Padding(
        padding: const EdgeInsets.only(top: Gap.small, right: Gap.small),
        child: Column(
          children: [
            IconButton(
              onPressed: onClose,
              color: context.theme.colorScheme.primary,
              icon: const Icon(IconPack.mdi_close),
            ),
          ],
        ),
      ),
      child: (_) => KitText(text: message),
    ),
  );
}
