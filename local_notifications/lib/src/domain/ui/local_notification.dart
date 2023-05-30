import 'dart:async';

import 'package:flutter/material.dart';

import '../../service/enums.dart';
import '../../service/extensions.dart';
import 'notification_content.dart';
import 'progress_bar.dart';
import 'shadow_builder.dart';

// ignore: must_be_immutable
class LocalNotification extends StatefulWidget {
  LocalNotification({
    required this.child,
    this.shadowColor = Colors.grey,
    this.background = Colors.white,
    this.radius = 5.0,
    this.enableShadow = true,
    this.showProgressIndicator = true,
    this.closeButtonBuilder,
    this.progressIndicatorColor = Colors.blue,
    this.toastDuration = const Duration(milliseconds: 3000),
    this.isCloseButtonVisible = true,
    this.notificationPosition = NotificationPosition.topRight,
    this.animation = AnimationType.fromRight,
    this.animationDuration = const Duration(milliseconds: 250),
    this.autoDismiss = true,
    this.height,
    this.width,
    this.progressIndicatorBackground = Colors.grey,
    super.key,
  }) {
    if (showProgressIndicator) {
      assert(autoDismiss != false);
    }

    if (notificationPosition == NotificationPosition.centerRight) {
      assert(
        animation != AnimationType.fromLeft && animation != AnimationType.fromBottom && animation != AnimationType.fromTop,
      );
    } else if (notificationPosition == NotificationPosition.centerLeft) {
      assert(
        animation != AnimationType.fromRight && animation != AnimationType.fromBottom && animation != AnimationType.fromTop,
      );
    } else if (notificationPosition == NotificationPosition.topCenter) {
      assert(
        animation != AnimationType.fromBottom && animation != AnimationType.fromLeft && animation != AnimationType.fromRight,
      );
    } else if (notificationPosition == NotificationPosition.topRight) {
      assert(
        animation != AnimationType.fromLeft && animation != AnimationType.fromBottom,
      );
    } else if (notificationPosition == NotificationPosition.topLeft) {
      assert(
        animation != AnimationType.fromRight && animation != AnimationType.fromBottom,
      );
    } else if (notificationPosition == NotificationPosition.bottomCenter) {
      assert(
        animation != AnimationType.fromTop && animation != AnimationType.fromLeft && animation != AnimationType.fromRight,
      );
    } else if (notificationPosition == NotificationPosition.bottomRight) {
      assert(
        animation != AnimationType.fromLeft && animation != AnimationType.fromTop,
      );
    } else if (notificationPosition == NotificationPosition.bottomLeft) {
      assert(
        animation != AnimationType.fromRight && animation != AnimationType.fromTop,
      );
    }
  }

  final CloseButtonBuilder child;
  final AnimationType animation;
  final Duration animationDuration;
  final Color shadowColor;
  final Color background;
  final Color progressIndicatorColor;
  final double radius;
  final Duration toastDuration;
  final bool enableShadow;
  final bool showProgressIndicator;
  final bool isCloseButtonVisible;
  final CloseButtonBuilder? closeButtonBuilder;
  final NotificationPosition notificationPosition;
  final bool autoDismiss;
  final double? width;
  final double? height;
  final Color progressIndicatorBackground;

  OverlayEntry? overlayEntry;
  late LocalNotificationState stateCache;

  void show(BuildContext context) {
    overlayEntry = _overlayEntryBuilder();
    Overlay.maybeOf(context)?.insert(overlayEntry!);
  }

  void closeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (BuildContext context) {
        return ShadowBuilder(
          onClose: () => stateCache.close(),
          child: AlertDialog(
            alignment: notificationPosition.alignment,
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            elevation: 0,
            content: this,
          ),
        );
      },
    );
  }

  @override
  LocalNotificationState createState() {
    stateCache = LocalNotificationState();
    return stateCache;
  }
}

class LocalNotificationState extends State<LocalNotification> with SingleTickerProviderStateMixin {
  late Timer closeTimer;
  late Animation<Offset> offsetAnimation;
  late AnimationController slideController;

  @override
  void initState() {
    super.initState();

    closeTimer = Timer(widget.toastDuration, () {
      slideController.reverse();
      slideController.addListener(() {
        if (slideController.isDismissed) {
          widget.closeOverlay();
        }
      });
    });
    if (!widget.autoDismiss) {
      closeTimer.cancel();
    }
    _initializeAnimation();
  }

  void _initializeAnimation() {
    slideController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    switch (widget.animation) {
      case AnimationType.fromLeft:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(-2, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: slideController,
            curve: Curves.ease,
          ),
        );
        break;
      case AnimationType.fromRight:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(2, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: slideController,
            curve: Curves.ease,
          ),
        );
        break;
      case AnimationType.fromTop:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(0, -7),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: slideController,
            curve: Curves.ease,
          ),
        );
        break;
      case AnimationType.fromBottom:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(0, 4),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: slideController,
            curve: Curves.ease,
          ),
        );
        break;
      default:
    }

    /// ! To support Flutter < 3.0.0
    /// This allows a value of type T or T?
    /// to be treated as a value of type T?.
    ///
    /// We use this so that APIs that have become
    /// non-nullable can still be used with `!` and `?`
    /// to support older versions of the API as well.
    T? ambiguate<T>(T? value) => value;

    ambiguate(WidgetsBinding.instance)?.addPostFrameCallback(
      (_) => slideController.forward(),
    );
  }

  void close() {
    closeTimer.cancel();
    unawaited(slideController.reverse().then((_) async {
      await Future<void>.delayed(const Duration(milliseconds: 250));
      widget.closeOverlay();
    }));
  }

  @override
  void dispose() {
    slideController.dispose();
    closeTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: offsetAnimation,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.radius),
        child: Container(
          width: widget.width ?? MediaQuery.of(context).size.width * 0.7,
          height: widget.height ?? MediaQuery.of(context).size.height * 0.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            color: widget.background,
            boxShadow: widget.enableShadow
                ? [
                    BoxShadow(
                      color: widget.shadowColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ]
                : null,
          ),
          child: Column(
            children: [
              Expanded(
                child: NotificationContent(
                  closeButtonBuilder: widget.closeButtonBuilder,
                  isCloseButtonVisible: widget.isCloseButtonVisible,
                  onClose: close,
                  child: widget.child(close),
                ),
              ),
              if (widget.showProgressIndicator)
                ProgressBar(
                  foregroundColor: widget.progressIndicatorColor,
                  duration: widget.toastDuration,
                  backgroundColor: widget.progressIndicatorBackground,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
