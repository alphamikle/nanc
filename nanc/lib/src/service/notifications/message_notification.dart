import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:tools/tools.dart';

import '../../domain/ui_kit/domain/logic/constants/gap.dart';
import '../../domain/ui_kit/domain/logic/model/local_notification_enums.dart';
import '../../domain/ui_kit/domain/logic/service/local_notificator.dart';
import '../../domain/ui_kit/domain/ui/components/kit_notification/local_notification.dart';
import '../../domain/ui_kit/domain/ui/components/kit_text.dart';

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
      child: (_) => Padding(
        padding: const EdgeInsets.all(Gap.regular),
        child: KitText(text: message),
      ),
    ),
  );
}
