import 'package:nanc_client/logic/default_page/default_page_screen.dart';
import 'package:tools/tools.dart';

Future<Json> defaultPageData() async {
  return <String, dynamic>{
    'screen': {
      'content': await defaultPageScreen(),
    }
  };
}
