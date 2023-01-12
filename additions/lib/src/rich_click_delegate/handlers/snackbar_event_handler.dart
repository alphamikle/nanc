import 'package:additions/src/rich_click_delegate/rich_click_handler.dart';
import 'package:flutter/material.dart';

final RegExp _snackBarRegExp = RegExp(r'^snackbar: ?(?<content>.*)$');

final RichClickHandler snackbarDemoHandler = RichClickHandler(
  test: (BuildContext context, String event) => _snackBarRegExp.hasMatch(event),
  handler: (BuildContext context, String event) {
    final String content = _snackBarRegExp.firstMatch(event)!.namedGroup('content')!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(content)),
    );
  },
);
