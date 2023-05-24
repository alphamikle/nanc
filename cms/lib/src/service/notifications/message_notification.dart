import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

void showMessageNotification(BuildContext context, String message) {
  ElegantNotification.info(
    description: KitText(text: message),
    animation: AnimationType.fromBottom,
    width: 300,
    iconSize: 30,
    animationDuration: const Duration(milliseconds: 750),
    notificationPosition: NotificationPosition.bottomLeft,
    toastDuration: const Duration(seconds: 10),
    closeButton: (VoidCallback onClose) => Padding(
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
  ).show(context);
}
