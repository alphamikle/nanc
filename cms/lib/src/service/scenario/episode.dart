import 'package:flutter/material.dart';

class Episode {
  const Episode({
    this.text,
    this.builder,
    this.style,
    this.delay,
  });

  final String? text;
  final WidgetBuilder? builder;
  final TextStyle? style;
  final Duration? delay;
}
