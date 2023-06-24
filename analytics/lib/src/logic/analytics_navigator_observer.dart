import 'package:go_router/go_router.dart';

import '../../analytics.dart';

typedef VRouterNavigationEventObserver = Future<void> Function(GoRouterState vRedirector);

VRouterNavigationEventObserver analyticsObserver(String eventName) {
  return (GoRouterState state) async {
    Analytics.sendEvent(
      eventName,
      data: <String, dynamic>{
        'to_url': state.location,
        'path_parameters': state.pathParameters,
        'query_parameters': state.queryParameters,
      },
    );
  };
}
