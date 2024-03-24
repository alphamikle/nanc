// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'dart:ui' as ui;

import 'package:nanc/src/service/config/config.dart';
import 'package:flutter/material.dart';

enum IndicatorPosition {
  middle,
  last,
  parent,
}

class ChildIndicator extends StatelessWidget {
  const ChildIndicator({
    required this.childColor,
    required this.parentColor,
    required this.position,
    this.middleBottomFixer = 0,
    this.limitedCenter = true,
    super.key,
  });

  final Color childColor;
  final Color parentColor;
  final IndicatorPosition position;
  final double middleBottomFixer;
  final bool limitedCenter;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return CustomPaint(
          painter: _IndicatorPainter(
            childColor: childColor,
            parentColor: parentColor,
            position: position,
            middleBottomFixer: middleBottomFixer,
            limitedCenter: limitedCenter,
          ),
        );
      },
    );
  }
}

class _IndicatorPainter extends CustomPainter {
  _IndicatorPainter({
    required this.childColor,
    required this.parentColor,
    required this.position,
    required this.middleBottomFixer,
    required this.limitedCenter,
  });

  final Color childColor;
  final Color parentColor;
  final IndicatorPosition position;
  final double middleBottomFixer;
  final bool limitedCenter;

  @override
  void paint(Canvas canvas, Size size) {
    final double x = size.width;
    const double xStart = 0;
    final double xCenter = x / 2;
    final double xEnd = x;

    final double y = size.height;
    const double yStart = 0;
    final double yCenter = limitedCenter ? min(y / 2, 25) : y / 2;
    final double yEnd = y;

    const double stroke = 2.25;

    final Paint parentPaint = Paint()
      ..color = parentColor
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke;

    final Paint childPaint = Paint()
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke
      ..shader = ui.Gradient.linear(Offset(xStart, yCenter), Offset(xEnd, yCenter), [
        parentColor,
        childColor,
      ], [
        0.65,
        1,
      ]);

    if (position == IndicatorPosition.middle) {
      canvas.drawLine(Offset(xStart, yStart), Offset(xStart, yEnd + middleBottomFixer), parentPaint);
      canvas.drawLine(Offset(xStart, yCenter), Offset(xEnd, yCenter), childPaint);
    } else if (position == IndicatorPosition.last) {
      const double angle = kPaddingSmall;
      final double leftLineBottom = yCenter - angle;
      const double rightLineLeft = xStart + angle;
      canvas.drawLine(Offset(xStart, yStart), Offset(xStart, leftLineBottom), parentPaint);
      final Path roundedLinePath = Path()
        ..moveTo(xStart, leftLineBottom)
        ..quadraticBezierTo(xStart, yCenter, rightLineLeft, yCenter);
      canvas.drawPath(roundedLinePath, childPaint);
      canvas.drawLine(Offset(rightLineLeft, yCenter), Offset(xEnd, yCenter), childPaint);
    } else if (position == IndicatorPosition.parent) {
      canvas.drawLine(Offset(xStart, yStart - 4), Offset(xStart, yEnd), parentPaint);
    }
  }

  @override
  bool shouldRepaint(_IndicatorPainter oldDelegate) {
    return true;
  }
}
