import 'package:flutter/material.dart';

import 'inline_span_proxy_widget.dart';

List<InlineSpan> collectInlineSpans(List<Widget> children) {
  return children.whereType<InlineSpanProxyWidget>().map((InlineSpanProxyWidget it) => it.inlineSpan).toList();
}
