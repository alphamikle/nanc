import 'package:additions/src/rich_click_delegate/rich_click_handler.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

final RegExp _shareRegExp = RegExp(r'^share: ?(?<content>.*)$');

final RichClickHandler shareDemoHandler = RichClickHandler(
  test: (BuildContext context, String event) => _shareRegExp.hasMatch(event),
  handler: (BuildContext context, String event) {
    final String content = _shareRegExp.firstMatch(event)!.namedGroup('content')!;
    Share.share(content);
  },
);
