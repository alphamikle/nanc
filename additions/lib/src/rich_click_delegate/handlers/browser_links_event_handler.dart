import 'package:additions/src/rich_click_delegate/rich_click_handler.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

final RegExp _browserRegExp = RegExp(r'^browser: ?(?<content>.*)$');

final RichClickHandler browserLinksEventDemoHandler = RichClickHandler(
  test: (BuildContext context, String event) => _browserRegExp.hasMatch(event),
  handler: (BuildContext context, String event) {
    final String content = _browserRegExp.firstMatch(event)!.namedGroup('content')!;
    launchUrlString(content);
  },
);
