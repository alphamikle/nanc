import 'package:bot_toast/bot_toast.dart';
import 'package:cms/src/service/config/config.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

void showMessageNotification(String message) {
  BotToast.showCustomNotification(
    duration: const Duration(seconds: 10),
    dismissDirections: [],
    toastBuilder: (VoidCallback onCancel) {
      return Padding(
        padding: const EdgeInsets.only(top: kPaddingLarge),
        child: Builder(
          builder: (BuildContext context) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: context.theme.colorScheme.secondaryContainer,
                border: Border.all(
                  color: context.theme.colorScheme.onPrimaryContainer,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(kPadding)),
                boxShadow: [
                  BoxShadow(
                    color: context.theme.colorScheme.primary.shadow,
                    spreadRadius: 10,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(kPaddingLarge),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(message),
                    Padding(
                      padding: const EdgeInsets.only(top: kPadding),
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
