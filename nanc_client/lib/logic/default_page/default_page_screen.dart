import 'package:flutter/services.dart';

Future<String> defaultPageScreen([int version = 1]) async {
  try {
    final String content = await rootBundle.loadString('assets/landing_page_v$version.html');
    return content;
  } catch (error) {
    // Handle error
    return '''
<safeArea>
  <text size="24" align="center">
    NOT FOUND ANY CONTENT FOR THE VERSION "$version"
  </text>
</safeArea>
''';
  }
}
