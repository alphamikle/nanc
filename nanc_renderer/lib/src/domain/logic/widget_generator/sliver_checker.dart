import 'package:flutter/material.dart';

bool isSliver(Widget widget) {
  return switch (widget) {
    SliverPersistentHeader() => true,
    _ => false,
  };
}
