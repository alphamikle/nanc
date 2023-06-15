import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/src/match.dart';

extension NavigatorFromContext on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  GoRouter get router => GoRouter.of(this);

  RouteMatchList get location => GoRouter.of(this).routerDelegate.currentConfiguration;
}
