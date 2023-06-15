import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/src/match.dart';

extension NavigatorFromContext on BuildContext {
  NavigatorState get navigator {
    return Navigator.of(this);
  }

  RouteMatchList get location {
    return GoRouter.of(this).routerDelegate.currentConfiguration;
  }
}
