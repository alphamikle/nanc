import 'package:flutter/material.dart';

import '../../../logic/constants/gap.dart';
import '../kit_buttons/kit_big_button.dart';
import '../kit_centered_text.dart';

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
          const KitCenteredText(text: 'TODO: ADD LOTTIE ANIMATION AND "ADD" BUTTON'),
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
