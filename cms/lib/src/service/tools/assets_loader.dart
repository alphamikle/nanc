import 'package:config/config.dart';

String prepareAssetPath(String assetPath) {
  if (Env.isPackageMode) {
    return 'packages/cms/$assetPath';
  }
  return assetPath;
}
