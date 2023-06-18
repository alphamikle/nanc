import 'dart:math';

import 'package:flutter/material.dart';

enum Zone {
  topLeft(0),
  top(1),
  topRight(2),
  left(3),
  center(4),
  right(5),
  bottomLeft(6),
  bottom(7),
  bottomRight(8);

  const Zone(this.square);

  final int square;
}

class KitWaveTransition extends StatelessWidget {
  const KitWaveTransition({
    required this.child,
    required this.animation,
    this.startingPoint = FractionalOffset.center,
    this.fallbackSize = 500,
    super.key,
  });

  final Widget child;
  final FractionalOffset startingPoint;
  final Animation<double> animation;
  final double fallbackSize;

  double get startX => startingPoint.dx;
  double get startY => startingPoint.dy;

  (double, double) calculateSize(BoxConstraints constraints) {
    double width = constraints.maxWidth;
    double height = constraints.maxHeight;

    if (width.isInfinite && height.isFinite) {
      width = height;
    } else if (height.isInfinite && width.isFinite) {
      height = width;
    } else if (height.isInfinite && width.isInfinite) {
      height = width = fallbackSize;
    }
    return (width, height);
  }

  double distance({required double x1, required double y1, required double x2, required double y2}) {
    /// √((x2 - x1)² + (y2 - y1)²)
    return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
  }

  double calculateMaxDistance(BoxConstraints constraints) {
    final (double width, double height) = calculateSize(constraints);

    final double x = startX * width;
    final double y = startY * height;

    const double leftTopX = 0;
    const double leftTopY = 0;
    final double rightTopX = 1 * width;
    const double rightTopY = 0;
    final double rightBottomX = 1 * width;
    final double rightBottomY = 1 * height;
    const double leftBottomX = 0;
    final double leftBottomY = 1 * height;

    final double distanceToLeftTopCorner = distance(x1: x, y1: y, x2: leftTopX, y2: leftTopY);
    final double distanceToRightTopCorner = distance(x1: x, y1: y, x2: rightTopX, y2: rightTopY);
    final double distanceToRightBottomCorner = distance(x1: x, y1: y, x2: rightBottomX, y2: rightBottomY);
    final double distanceToLeftBottomCorner = distance(x1: x, y1: y, x2: leftBottomX, y2: leftBottomY);

    final double maximumDistance = max(
      max(
        distanceToLeftTopCorner,
        distanceToLeftBottomCorner,
      ),
      max(
        distanceToRightTopCorner,
        distanceToRightBottomCorner,
      ),
    );
    return maximumDistance;
  }

  // 4 - starting point inside of the widget
  //   ┌─────┬─────┬─────┐
  //   │     │     │     │
  //   │  0  │  1  │  2  │
  //   │     │     │     │
  //   ├─────┼─────┼─────┤
  //   │     │     │     │
  //   │  3  │  4  │  5  │
  //   │     │     │     │
  //   ├─────┼─────┼─────┤
  //   │     │     │     │
  //   │  6  │  7  │  8  │
  //   │     │     │     │
  //   └─────┴─────┴─────┘
  double calculateClosestSurfaceDistance(BoxConstraints constraints) {
    final (double width, double height) = calculateSize(constraints);
    final double aspectRatio = width / height;
    late final Zone zone;
    if (startX < 0 && startY < 0) {
      zone = Zone.topLeft;
    } else if (startX >= 0 && startX <= 1 && startY < 0) {
      zone = Zone.top;
    } else if (startX > 1 && startY < 0) {
      zone = Zone.topRight;
    } else if (startX < 0 && startY >= 0 && startY <= 1) {
      zone = Zone.left;
    } else if (startX > 1 && startY >= 0 && startY <= 1) {
      zone = Zone.right;
    } else if (startX < 1 && startY > 1) {
      zone = Zone.bottomLeft;
    } else if (startX >= 0 && startX <= 1 && startY > 1) {
      zone = Zone.bottom;
    } else if (startX > 1 && startY > 1) {
      zone = Zone.bottomRight;
    } else {
      zone = Zone.center;
    }
    final double closestSurfaceDistance = switch (zone) {
      Zone.topLeft => distance(x1: startX, y1: startY * aspectRatio, x2: 0, y2: 0),
      Zone.top => (startY * aspectRatio).abs(),
      Zone.topRight => distance(x1: startX, y1: startY * aspectRatio, x2: 1, y2: 0),
      Zone.left => startX.abs(),
      Zone.center => 0,
      Zone.right => startX - 1,
      Zone.bottomLeft => distance(x1: startX, y1: startY * aspectRatio, x2: 0, y2: 1 * aspectRatio),
      Zone.bottom => startY - 1,
      Zone.bottomRight => distance(x1: startX, y1: startY * aspectRatio, x2: 1, y2: 1 * aspectRatio),
    };
    return closestSurfaceDistance;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final (double width, double _) = calculateSize(constraints);
        final double maximumDistance = calculateMaxDistance(constraints) / (width / 2);
        final double closestSurfaceDistance = calculateClosestSurfaceDistance(constraints);
        final double value = (closestSurfaceDistance * 2) + (maximumDistance * animation.value);

        return AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return _WaveAnimation(
              startingPoint: startingPoint,
              value: value,
              child: child!,
            );
          },
          child: child,
        );
      },
    );
  }
}

class _WaveAnimation extends StatelessWidget {
  const _WaveAnimation({
    required this.startingPoint,
    required this.value,
    required this.child,
  });

  final FractionalOffset startingPoint;
  final double value;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      // blendMode: BlendMode.modulate,
      shaderCallback: (Rect rect) {
        return RadialGradient(
          colors: const [
            Colors.white,
            Colors.white,
            Colors.transparent,
            Colors.transparent,
          ],
          stops: const [
            0.0,
            0.5,
            0.5,
            1.0,
          ],
          center: startingPoint,
          radius: max(value, 0),
        ).createShader(rect);
      },
      child: child,
    );
  }
}
