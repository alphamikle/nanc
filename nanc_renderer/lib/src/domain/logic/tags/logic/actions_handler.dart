import 'package:flutter/material.dart';
import 'package:nanc_renderer/src/domain/logic/tags/logic/click_delegate.dart';

VoidCallback? handleClick(BuildContext context, String? event) {
  if (event == null) {
    return null;
  }
  // ignore: discarded_futures
  return () => ClickDelegate.of(context).onPressed(event);
}
