import 'package:flutter/material.dart';

typedef SliverChecker = bool Function(Widget widget);

bool isSliver(Widget widget, {SliverChecker? checker}) {
  return switch (widget) {
    SliverAppBar() => true,
    SliverGrid() => true,
    SliverList() => true,
    SliverFixedExtentList() => true,
    SliverPadding() => true,
    SliverPersistentHeader() => true,
    SliverToBoxAdapter() => true,
    _ => checker?.call(widget) ?? false,
  };
}
