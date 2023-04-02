import 'package:cms/src/service/errors/error_wrapper.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class ErrorToaster extends StatelessWidget {
  const ErrorToaster({
    required this.errorWrapper,
    required this.onClose,
    super.key,
  });

  final ErrorWrapper errorWrapper;
  final VoidCallback onClose;

  String get errorText {
    const List<Pattern> badWords = [
      'Exception: ',
    ];

    String text = errorWrapper.error?.toString() ?? 'Unknown error';
    if (Env.isProduction) {
      for (final Pattern badWord in badWords) {
        text = text.replaceFirst(badWord, '');
      }
    }
    return text.trim();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
      color: context.theme.colorScheme.onErrorContainer,
    );

    final Widget text = Text(
      errorText,
      style: style,
    );
    final Widget closeButton = KitButton(
      text: 'Close',
      onPressed: onClose,
      color: context.theme.colorScheme.error,
    );

    Widget body = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: Gap.regular),
          child: closeButton,
        ),
        text,
        KitDivider.vertical(Gap.large),
        Text(
          errorWrapper.stackTrace.toString(),
          style: style,
        ),
      ],
    );
    if (Env.isProduction) {
      body = Row(
        children: [
          Expanded(child: text),
          closeButton,
        ],
      );
    }

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
          child: body,
        ),
      ),
    );
  }
}
