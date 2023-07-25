import 'package:flutter/material.dart';

import 'click_delegate.dart';

VoidCallback? handleClick(BuildContext context, String? event) {
  if (event == null) {
    return null;
  }
  final ClickDelegate delegate = ClickDelegate.of(context);
  return () async => delegate.onPressed(context, event);
}
