import 'package:analytics/analytics.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../rich_click_handler.dart';

final RegExp _browserRegExp = RegExp(r'^browser: ?(?<content>.*)$');

final RichClickHandler browserLinksEventDemoHandler = RichClickHandler(
  test: (BuildContext context, String event) => _browserRegExp.hasMatch(event),
  handler: (BuildContext context, String event) async {
    final String content = _browserRegExp.firstMatch(event)!.namedGroup('content')!;
    final bool isRealLink = content.startsWith('http');
    if (isRealLink == false) {
      Analytics.sendEvent('BROWSER_LINK_EVENT_NOT_HANDLED', data: <String, dynamic>{
        'content': content,
      });
      throw Exception('"$content" is incorrect link!');
    }
    Analytics.sendEvent('BROWSER_LINK_EVENT_HANDLED', data: <String, dynamic>{
      'content': content,
    });
    await launchUrlString(
      content,
      mode: LaunchMode.externalApplication,
    );
  },
);
