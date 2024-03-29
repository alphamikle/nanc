import 'package:flutter/material.dart';

typedef CloseButtonBuilder = Widget Function(VoidCallback onClose);

class NotificationContent extends StatelessWidget {
  const NotificationContent({
    required this.child,
    required this.isCloseButtonVisible,
    required this.onClose,
    this.closeButtonBuilder,
    super.key,
  });

  final Widget child;
  final VoidCallback onClose;
  final bool isCloseButtonVisible;
  final CloseButtonBuilder? closeButtonBuilder;

  @override
  Widget build(BuildContext context) {
    if (isCloseButtonVisible == false) {
      return child;
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              child,
            ],
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: IconButton(
            color: Theme.of(context).colorScheme.error,
            onPressed: onClose,
            icon: const Icon(
              Icons.close,
            ),
          ),
        ),
      ],
    );
  }
}
