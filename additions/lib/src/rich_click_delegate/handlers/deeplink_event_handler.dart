import 'package:additions/src/rich_click_delegate/rich_click_handler.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

final RegExp _deeplinkRegExp = RegExp(r'^deeplink: ?(?<content>.*)$');

final RichClickHandler deeplinkEventDemoHandler = RichClickHandler(
  test: (BuildContext context, String event) => _deeplinkRegExp.hasMatch(event),
  handler: (BuildContext context, String event) {
    final String content = _deeplinkRegExp.firstMatch(event)!.namedGroup('content')!;
    launchUrlString(content);
  },
);
