import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:tools/tools.dart';

import '../../domain/ui_kit/domain/ui/components/kit_buttons/kit_button.dart';
import '../../domain/ui_kit/domain/ui/components/kit_divider.dart';
import '../../domain/ui_kit/domain/ui/components/kit_text.dart';
import '../../domain/ui_kit/domain/logic/constants/gap.dart';
import 'human_exception.dart';

class ErrorToaster extends StatelessWidget {
  const ErrorToaster({
    required this.exception,
    required this.onClose,
    super.key,
  });

  final HumanException exception;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Gap.extra),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.errorContainer,
          borderRadius: const BorderRadius.all(Radius.circular(Gap.small)),
          border: Border.all(color: context.theme.colorScheme.onErrorContainer.withOpacity(0.5)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Gap.large),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 350),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: Gap.regular),
                      child: Icon(
                        IconPack.flu_error_circle_filled,
                        color: context.theme.colorScheme.error,
                      ),
                    ),
                    KitText(text: 'An error has occurred', style: context.theme.textTheme.titleMedium),
                  ],
                ),
                KitDivider.vertical(Gap.regular),
                KitText(text: exception.humanMessage, style: context.theme.textTheme.titleSmall),
                KitDivider.vertical(Gap.large),
                if (exception.hasOriginalMessage) KitText(text: exception.originalMessage!, style: context.theme.textTheme.bodySmall),
                if (Env.isProduction == false && Env.simpleErrors == false && exception.hasStackTrace) KitDivider.vertical(Gap.regular),
                if (Env.isProduction == false && Env.simpleErrors == false && exception.hasStackTrace)
                  KitText(
                    text: exception.stackTrace.toString(),
                    style: context.theme.textTheme.bodySmall,
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: Gap.large),
                  child: KitButton(
                    text: 'Close',
                    onPressed: onClose,
                    color: context.theme.colorScheme.error,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
