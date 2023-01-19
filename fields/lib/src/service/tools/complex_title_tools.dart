import 'package:ui_kit/ui_kit.dart';

List<String> splitComplexTitle(String title) => title.split(kDelimiter.replaceAll(' ', '')).map((String it) => it.trim()).toList();
