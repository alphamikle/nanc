import 'package:bot_toast/bot_toast.dart';
import 'package:cms/src/service/config/config.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

void showMessageNotification(String message) {
  BotToast.showCustomNotification(
    duration: const Duration(seconds: 5),
    dismissDirections: [],
    toastBuilder: (VoidCallback onCancel) {
      return Padding(
        padding: const EdgeInsets.only(top: Gap.large),
        child: Builder(
          builder: (BuildContext context) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: context.theme.colorScheme.secondaryContainer,
                border: Border.all(
                  color: context.theme.colorScheme.primary.withOpacity(0.5),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(Gap.small)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(kPaddingLarge),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(message.trim()),
                    Padding(
                      padding: const EdgeInsets.only(top: Gap.regular),
                      child: KitButton(
                        text: 'Close',
                        onPressed: onCancel,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
