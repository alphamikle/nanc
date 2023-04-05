import 'package:flutter/services.dart';
import 'logg.dart';
// import 'package:super_clipboard/super_clipboard.dart';

Future<bool> copyTextToClipboard(String? value) async {
  if (value != null) {
    logg.wrap(value, prefix: 'DATA COPIED');
    await Clipboard.setData(ClipboardData(text: value));
    // await ClipboardWriter.instance.write([
    //   DataWriterItem()..add(Formats.plainText(value)),
    // ]);
    return true;
  }
  return false;
}
