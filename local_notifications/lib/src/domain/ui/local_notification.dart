import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../service/enums.dart';
import 'notification_content.dart';
import 'progress_bar.dart';

class LocalNotification extends StatefulWidget {
  const LocalNotification({
    required this.child,
    required this.onClose,
    required GlobalKey<LocalNotificationState> key,
    required this.animationDuration,
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
    this.autoDismiss = true,
    this.height,
    this.width,
    this.progressIndicatorBackground = Colors.grey,
    this.shadeBackground = false,
  }) : super(key: key);

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
  final AsyncCallback onClose;
  final bool shadeBackground;

  @override
  LocalNotificationState createState() => LocalNotificationState();
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
          unawaited(widget.onClose());
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
          end: Offset.zero,
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
          end: Offset.zero,
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
          end: Offset.zero,
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
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: slideController,
            curve: Curves.ease,
          ),
        );
        break;
      default:
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => slideController.forward());
  }

  Future<void> close() async {
    closeTimer.cancel();
    await Future.wait([
      slideController.reverse(),
      widget.onClose(),
    ]);
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
          width: widget.width ?? MediaQuery.of(context).size.width * 0.75,
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
