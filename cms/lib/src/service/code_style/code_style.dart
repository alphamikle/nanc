import 'package:tools/tools.dart';

class CodeStyle {
  CodeStyle({
    required this.rootKey,
  });

  final RootKey rootKey;

  PatternMap get patternMap {
    return {
      // '(<).*/>': TextStyle(
      //   color: Colors.red,
      // ),
    };
  }
}
