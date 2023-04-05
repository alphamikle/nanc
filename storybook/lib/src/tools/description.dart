import 'package:flutter/material.dart';
import 'usecase_factory.dart';

class Description {
  const Description({
    required this.groupName,
    required this.componentName,
    required this.builder,
  });

  final ComponentName componentName;
  final GroupName groupName;
  final WidgetBuilder builder;
}
