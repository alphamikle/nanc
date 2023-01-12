import 'package:flutter/services.dart';
// import 'package:super_clipboard/super_clipboard.dart';

Future<bool> copyTextToClipboard(String? value) async {
  if (value != null) {
    await Clipboard.setData(ClipboardData(text: value));
    // await ClipboardWriter.instance.write([
    //   DataWriterItem()..add(Formats.plainText(value)),
    // ]);
    return true;
  }
  return false;
}
