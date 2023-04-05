import 'dart:async';

import 'package:analytics/analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../logic/bloc/page_bloc.dart';
import '../ui/view/main_view.dart';

typedef RouterHook = Future<void> Function(VRedirector vRedirector);

RouterHook initPage(PageBloc pageBloc) {
  return (VRedirector vRedirector) async => unawaited(pageBloc.preload(vRedirector.toUrl!));
}

List<VRouteElement> generateRoutes(BuildContext context) {
  final PageBloc pageBloc = context.read();

  return [
    VGuard(
      beforeEnter: analyticsObserver('BEFORE_ENTER'),
      beforeUpdate: analyticsObserver('BEFORE_UPDATE'),
      stackedRoutes: [
        VGuard(
          beforeEnter: initPage(pageBloc),
          beforeUpdate: initPage(pageBloc),
          stackedRoutes: [
            VWidget.builder(
              path: '/',
              builder: (BuildContext context, VRouterData data) {
                return BlocProvider.value(
                  value: pageBloc,
                  child: const MainView(isRoot: true),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ];
}
