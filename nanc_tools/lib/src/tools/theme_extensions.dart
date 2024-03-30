import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }
}

extension MediaQueryExtension on BuildContext {
  MediaQueryData get query {
    return MediaQuery.of(this);
  }
}
