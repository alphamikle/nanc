import 'package:flutter/cupertino.dart';

typedef DescriptionFactory = FieldDescription Function([BuildContext? context]);

class FieldDescription {
  const FieldDescription({
    required this.icon,
    required this.color,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String description;
}
