/// The components of HSV Color Picker
///
/// Try to create a Color Picker with other layout on your own :)
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils.dart';

/// Palette types for color picker area widget.
enum PaletteType {
  hsv,
}

/// Track types for slider picker.
enum TrackType {
  hue,
  alpha,
}
// enum ColorSpace { rgb, hsv, hsl, hsp, okhsv, okhsl, xyz, yuv, lab, lch, cmyk }

/// Painter for SV mixture.
class HSVWithHueColorPainter extends CustomPainter {
  const HSVWithHueColorPainter(this.hsvColor, {this.pointerColor});

  final HSVColor hsvColor;
  final Color? pointerColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    const Gradient gradientV = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.white, Colors.black],
    );
    final Gradient gradientH = LinearGradient(
      colors: [
        Colors.white,
        HSVColor.fromAHSV(1, hsvColor.hue, 1, 1).toColor(),
      ],
    );
    canvas.drawRect(rect, Paint()..shader = gradientV.createShader(rect));
    canvas.drawRect(
      rect,
      Paint()
        ..blendMode = BlendMode.multiply
        ..shader = gradientH.createShader(rect),
    );

    canvas.drawCircle(
      Offset(size.width * hsvColor.saturation, size.height * (1 - hsvColor.value)),
      size.height * 0.04,
      Paint()
        ..color = pointerColor ?? (useWhiteForeground(hsvColor.toColor()) ? Colors.white : Colors.black)
        ..strokeWidth = 1.5
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _SliderLayout extends MultiChildLayoutDelegate {
  static const String track = 'track';
  static const String thumb = 'thumb';
  static const String gestureContainer = 'gesturecontainer';

  @override
  void performLayout(Size size) {
    layoutChild(
      track,
      BoxConstraints.tightFor(
        width: size.width - 30.0,
        height: size.height / 5,
      ),
    );
    positionChild(track, Offset(15, size.height * 0.4));
    layoutChild(
      thumb,
      BoxConstraints.tightFor(width: 5, height: size.height / 4),
    );
    positionChild(thumb, Offset(0, size.height * 0.4));
    layoutChild(
      gestureContainer,
      BoxConstraints.tightFor(width: size.width, height: size.height),
    );
    positionChild(gestureContainer, Offset.zero);
  }

  @override
  bool shouldRelayout(_SliderLayout oldDelegate) => false;
}

/// Painter for all kinds of track types.
class TrackPainter extends CustomPainter {
  const TrackPainter(this.trackType, this.hsvColor);

  final TrackType trackType;
  final HSVColor hsvColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    if (trackType == TrackType.alpha) {
      final Size chessSize = Size(size.height / 2, size.height / 2);
      Paint chessPaintB = Paint()..color = const Color(0xffcccccc);
      Paint chessPaintW = Paint()..color = Colors.white;
      List.generate((size.height / chessSize.height).round(), (int y) {
        List.generate((size.width / chessSize.width).round(), (int x) {
          canvas.drawRect(
            Offset(chessSize.width * x, chessSize.width * y) & chessSize,
            (x + y) % 2 != 0 ? chessPaintW : chessPaintB,
          );
        });
      });
    }

    switch (trackType) {
      case TrackType.hue:
        canvas.drawRect(
            rect,
            Paint()
              ..shader = LinearGradient(
                colors: [
                  const HSVColor.fromAHSV(1, 0, 1, 1).toColor(),
                  const HSVColor.fromAHSV(1, 60, 1, 1).toColor(),
                  const HSVColor.fromAHSV(1, 120, 1, 1).toColor(),
                  const HSVColor.fromAHSV(1, 180, 1, 1).toColor(),
                  const HSVColor.fromAHSV(1, 240, 1, 1).toColor(),
                  const HSVColor.fromAHSV(1, 300, 1, 1).toColor(),
                  const HSVColor.fromAHSV(1, 360, 1, 1).toColor(),
                ],
              ).createShader(rect));
        break;
      case TrackType.alpha:
        canvas.drawRect(
            rect,
            Paint()
              ..shader = LinearGradient(
                colors: [
                  hsvColor.toColor().withOpacity(0),
                  hsvColor.toColor().withOpacity(1),
                ],
              ).createShader(rect));
        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Painter for thumb of slider.
class ThumbPainter extends CustomPainter {
  const ThumbPainter({this.thumbColor, this.fullThumbColor = false});

  final Color? thumbColor;
  final bool fullThumbColor;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawShadow(
      Path()
        ..addOval(
          Rect.fromCircle(center: const Offset(0.5, 2), radius: size.width * 1.8),
        ),
      Colors.black,
      3,
      true,
    );
    canvas.drawCircle(
        Offset(0, size.height * 0.4),
        size.height,
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill);
    if (thumbColor != null) {
      canvas.drawCircle(
          Offset(0, size.height * 0.4),
          size.height * (fullThumbColor ? 1.0 : 0.65),
          Paint()
            ..color = thumbColor!
            ..style = PaintingStyle.fill);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Painter for chess type alpha background in color indicator widget.
class IndicatorPainter extends CustomPainter {
  const IndicatorPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Size chessSize = Size(size.width / 10, size.height / 10);
    final Paint chessPaintB = Paint()..color = const Color(0xFFCCCCCC);
    final Paint chessPaintW = Paint()..color = Colors.white;
    List.generate((size.height / chessSize.height).round(), (int y) {
      List.generate((size.width / chessSize.width).round(), (int x) {
        canvas.drawRect(
          Offset(chessSize.width * x, chessSize.height * y) & chessSize,
          (x + y) % 2 != 0 ? chessPaintW : chessPaintB,
        );
      });
    });

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        size.height / 2,
        Paint()
          ..color = color
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

typedef ColorPickerUpdateEvent = void Function(HSVColor color, bool isMonochromeMode);

/// 9 track types for slider picker widget.
class ColorPickerSlider extends StatelessWidget {
  const ColorPickerSlider(
    this.trackType,
    this.hsvColor,
    this.onColorChanged, {
    super.key,
    this.displayThumbColor = false,
    this.fullThumbColor = false,
  });

  final TrackType trackType;
  final HSVColor hsvColor;
  final ColorPickerUpdateEvent onColorChanged;
  final bool displayThumbColor;
  final bool fullThumbColor;

  bool get isMonochrome => hsvColor.saturation == 0.0;

  void slideEvent(RenderBox getBox, BoxConstraints box, Offset globalPosition) {
    double localDx = getBox.globalToLocal(globalPosition).dx - 15.0;
    double progress = localDx.clamp(0.0, box.maxWidth - 30.0) / (box.maxWidth - 30.0);
    switch (trackType) {
      case TrackType.hue:
        // 360 is the same as zero
        // if set to 360, sliding to end goes to zero
        onColorChanged(hsvColor.withHue(progress * 359), isMonochrome);
        break;
      case TrackType.alpha:
        onColorChanged(hsvColor.withAlpha(localDx.clamp(0.0, box.maxWidth - 30.0) / (box.maxWidth - 30.0)), isMonochrome);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints box) {
      double thumbOffset = 15;
      Color thumbColor;
      switch (trackType) {
        case TrackType.hue:
          thumbOffset += (box.maxWidth - 30.0) * hsvColor.hue / 360;
          thumbColor = HSVColor.fromAHSV(1, hsvColor.hue, 1, 1).toColor();
          break;
        case TrackType.alpha:
          thumbOffset += (box.maxWidth - 30.0) * hsvColor.toColor().opacity;
          thumbColor = hsvColor.toColor().withOpacity(hsvColor.alpha);
          break;
      }

      return CustomMultiChildLayout(
        delegate: _SliderLayout(),
        children: <Widget>[
          LayoutId(
            id: _SliderLayout.track,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              child: CustomPaint(
                painter: TrackPainter(
                  trackType,
                  hsvColor,
                ),
              ),
            ),
          ),
          LayoutId(
            id: _SliderLayout.thumb,
            child: Transform.translate(
              offset: Offset(thumbOffset, 0),
              child: CustomPaint(
                painter: ThumbPainter(
                  thumbColor: displayThumbColor ? thumbColor : null,
                  fullThumbColor: fullThumbColor,
                ),
              ),
            ),
          ),
          LayoutId(
            id: _SliderLayout.gestureContainer,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints box) {
                RenderBox? getBox = context.findRenderObject() as RenderBox?;
                return GestureDetector(
                  onPanDown: (DragDownDetails details) => getBox != null ? slideEvent(getBox, box, details.globalPosition) : null,
                  onPanUpdate: (DragUpdateDetails details) => getBox != null ? slideEvent(getBox, box, details.globalPosition) : null,
                );
              },
            ),
          ),
        ],
      );
    });
  }
}

/// Simple round color indicator.
class ColorIndicator extends StatelessWidget {
  const ColorIndicator(
    this.hsvColor, {
    super.key,
    this.width = 50.0,
    this.height = 50.0,
  });

  final HSVColor hsvColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: const Color(0xffdddddd)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(1000)),
        child: CustomPaint(painter: IndicatorPainter(hsvColor.toColor())),
      ),
    );
  }
}

/// Provide Rectangle & Circle 2 categories, 10 variations of palette widget.
class ColorPickerArea extends StatelessWidget {
  const ColorPickerArea(
    this.hsvColor,
    this.onColorChanged, {
    super.key,
  });

  final HSVColor hsvColor;
  final ValueChanged<HSVColor> onColorChanged;
  final PaletteType paletteType = PaletteType.hsv;

  void _handleColorRectChange(double horizontal, double vertical) {
    onColorChanged(hsvColor.withSaturation(horizontal).withValue(vertical));
  }

  void _handleGesture(Offset position, BuildContext context, double height, double width) {
    final RenderBox? getBox = context.findRenderObject() as RenderBox?;
    if (getBox == null) return;

    final Offset localOffset = getBox.globalToLocal(position);
    final double horizontal = localOffset.dx.clamp(0.0, width);
    final double vertical = localOffset.dy.clamp(0.0, height);
    _handleColorRectChange(horizontal / width, 1 - vertical / height);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;

        return RawGestureDetector(
          gestures: {
            _AlwaysWinPanGestureRecognizer: GestureRecognizerFactoryWithHandlers<_AlwaysWinPanGestureRecognizer>(
              () => _AlwaysWinPanGestureRecognizer(),
              (_AlwaysWinPanGestureRecognizer instance) {
                instance
                  ..onDown = ((details) => _handleGesture(details.globalPosition, context, height, width))
                  ..onUpdate = ((details) => _handleGesture(details.globalPosition, context, height, width));
              },
            ),
          },
          child: Builder(
            builder: (BuildContext context) => CustomPaint(
              painter: HSVWithHueColorPainter(hsvColor),
            ),
          ),
        );
      },
    );
  }
}

class _AlwaysWinPanGestureRecognizer extends PanGestureRecognizer {
  @override
  void addAllowedPointer(event) {
    super.addAllowedPointer(event);
    resolve(GestureDisposition.accepted);
  }

  @override
  String get debugDescription => 'alwaysWin';
}

/// Uppercase text formater
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(oldValue, TextEditingValue newValue) => TextEditingValue(text: newValue.text.toUpperCase(), selection: newValue.selection);
}
