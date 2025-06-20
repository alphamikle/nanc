import 'package:flutter/material.dart';

enum AnimationType {
  fromLeft,
  fromRight,
  fromTop,
  fromBottom,
}

enum NotificationPosition {
  center,
  centerRight,
  centerLeft,
  topCenter,
  topRight,
  topLeft,
  bottomCenter,
  bottomRight,
  bottomLeft,
}

extension NotificationPositionExtension on NotificationPosition {
  Alignment get alignment {
    switch (this) {
      case NotificationPosition.center:
        return Alignment.center;
      case NotificationPosition.centerRight:
        return Alignment.centerRight;
      case NotificationPosition.centerLeft:
        return Alignment.centerLeft;
      case NotificationPosition.topCenter:
        return Alignment.topCenter;
      case NotificationPosition.topRight:
        return Alignment.topRight;
      case NotificationPosition.topLeft:
        return Alignment.topLeft;
      case NotificationPosition.bottomCenter:
        return Alignment.bottomCenter;
      case NotificationPosition.bottomRight:
        return Alignment.bottomRight;
      case NotificationPosition.bottomLeft:
        return Alignment.bottomLeft;
    }
  }
}
