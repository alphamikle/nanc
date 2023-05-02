import 'package:flutter/material.dart';

import 'click_delegate.dart';

VoidCallback? handleClick(BuildContext context, String? event) {
  if (event == null) {
    return null;
  }
  // ignore: discarded_futures
  return () => ClickDelegate.of(context).onPressed(context, event);
}
