import 'package:flutter/cupertino.dart';

extension NavigatorFromContext on BuildContext {
  NavigatorState get navigator {
    return Navigator.of(this);
  }
}
