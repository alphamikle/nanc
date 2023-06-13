import 'dart:async';

import 'package:cms/cms.dart';
import 'package:flutter/material.dart';

import 'domain/cms/cms_app.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await startCmsApp(DataProvider.firebaseLocal);
  }, ErrorsCatcher.catchZoneErrors);
}
