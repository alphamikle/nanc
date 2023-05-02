import 'package:analytics/analytics.dart';
import 'package:flutter/material.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:share_plus/share_plus.dart';

final RegExp _shareRegExp = RegExp(r'^share: ?(?<content>.*)$');

final ClickHandler shareDemoHandler = ClickHandler(
  test: (BuildContext context, String event) => _shareRegExp.hasMatch(event),
  handler: (BuildContext context, String event) {
    final String content = _shareRegExp.firstMatch(event)!.namedGroup('content')!;
    Analytics.sendEvent('SNARE_EVENT_HANDLED', data: <String, dynamic>{
      'content': content,
    });
    Share.share(content);
  },
);
