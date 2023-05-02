import 'package:flutter/material.dart';

import '../kit_preloader.dart';
import '../kit_text.dart';

class KitButton extends StatelessWidget {
  const KitButton({
    this.onPressed,
    this.child,
    this.text,
    this.color,
    this.isLoading = false,
    super.key,
  }) : assert(text != null && text != '' || child != null);

  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final Color? color;
  final bool isLoading;

  bool get withChild => child != null;
  bool get isEnabled => onPressed != null;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      opacity: color == null || isEnabled ? 1 : 0.3,
      child: OutlinedButton(
        onPressed: onPressed,
        style: color == null
            ? null
            : ButtonStyle(
                overlayColor: MaterialStatePropertyAll(color!.withOpacity(0.05)),
                foregroundColor: MaterialStatePropertyAll(color!),
                side: MaterialStatePropertyAll(BorderSide(color: color!.withOpacity(0.75))),
                backgroundColor: MaterialStatePropertyAll(color!.withOpacity(0.05)),
              ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: isLoading
              ? const SizedBox(
                  width: 50,
                  child: KitPreloader(),
                )
              : withChild
                  ? child!
                  : KitText(text: text!),
        ),
      ),
    );
  }
}
