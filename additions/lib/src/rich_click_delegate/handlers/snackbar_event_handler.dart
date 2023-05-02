import 'package:analytics/analytics.dart';
import 'package:flutter/material.dart';
import 'package:nanc_config/nanc_config.dart';

final RegExp _snackBarRegExp = RegExp(r'^snackbar: ?(?<content>.*)$');

final ClickHandler snackbarDemoHandler = ClickHandler(
  test: (BuildContext context, String event) => _snackBarRegExp.hasMatch(event),
  handler: (BuildContext context, String event) {
    final String content = _snackBarRegExp.firstMatch(event)!.namedGroup('content')!;
    Analytics.sendEvent('SNACK_BAR_EVENT_HANDLED', data: <String, dynamic>{
      'content': content,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(content)),
    );
  },
);
