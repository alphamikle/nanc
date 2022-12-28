import 'package:flutter/material.dart';
import 'package:ui_kit/src/components/kit_buttons/kit_big_button.dart';
import 'package:ui_kit/src/components/kit_not_found_text.dart';
import 'package:ui_kit/src/constants/gap.dart';

class KitIsEmptyPage extends StatelessWidget {
  const KitIsEmptyPage({
    required this.buttonText,
    required this.onAction,
    super.key,
  });

  final String buttonText;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const KitNotFoundText(text: 'TODO: ADD LOTTIE ANIMATION AND "ADD" BUTTON'),
          Padding(
            padding: const EdgeInsets.only(top: Gap.large),
            child: KitBigButton(
              onPressed: onAction,
              text: buttonText,
            ),
          ),
        ],
      ),
    );
  }
}
