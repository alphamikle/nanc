import 'package:analytics/analytics.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../rich_click_handler.dart';

final RegExp _deeplinkRegExp = RegExp(r'^deeplink: ?(?<content>.*)$');

final RichClickHandler deeplinkEventDemoHandler = RichClickHandler(
  test: (BuildContext context, String event) => _deeplinkRegExp.hasMatch(event),
  handler: (BuildContext context, String event) {
    final String content = _deeplinkRegExp.firstMatch(event)!.namedGroup('content')!;
    Analytics.sendEvent('DEEP_LINK_EVENT_HANDLED', data: <String, dynamic>{
      'content': content,
    });
    launchUrlString(content);
  },
);
