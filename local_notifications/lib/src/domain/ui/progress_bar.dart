import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({
    required this.foregroundColor,
    required this.backgroundColor,
    required this.duration,
    this.value = 0,
    super.key,
  });

  final Color foregroundColor;
  final Color backgroundColor;
  final Duration duration;
  final double value;

  @override
  ProgressBarState createState() {
    return ProgressBarState();
  }
}

class ProgressBarState extends State<ProgressBar> with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(duration: widget.duration, vsync: this);
  late final Animation<double> curve = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
  late Tween<double> tween = Tween<double>(begin: 1, end: 0);

  @override
  void initState() {
    super.initState();
    controller.forward();
  }

  @override
  void didUpdateWidget(ProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.value != oldWidget.value) {
      final double beginValue = tween.evaluate(curve);
      tween = Tween<double>(
        begin: beginValue,
        end: widget.value,
      );

      controller
        ..value = 0
        ..forward();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: curve,
      builder: (BuildContext context, Widget? child) {
        return LinearProgressIndicator(
          backgroundColor: widget.backgroundColor,
          valueColor: AlwaysStoppedAnimation(widget.foregroundColor),
          value: tween.evaluate(curve),
        );
      },
    );
  }
}
