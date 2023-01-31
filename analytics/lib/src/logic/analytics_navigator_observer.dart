import 'package:analytics/analytics.dart';
import 'package:vrouter/vrouter.dart';

typedef VRouterNavigationEventObserver = Future<void> Function(VRedirector vRedirector);

VRouterNavigationEventObserver analyticsObserver(String eventName) {
  return (VRedirector vRedirector) async {
    Analytics.sendEvent(
      eventName,
      data: <String, dynamic>{
        'to_url': vRedirector.toUrl,
        'from_url': vRedirector.fromUrl,
        'path_parameters': vRedirector.newVRouterData?.pathParameters,
        'query_parameters': vRedirector.newVRouterData?.queryParameters,
      },
    );
  };
}
