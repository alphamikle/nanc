import 'package:flutter/material.dart';

import 'domain/cms/cms_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await startCmsApp(DataProvider.firebase);
}
