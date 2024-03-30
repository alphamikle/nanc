import 'package:package_info_plus/package_info_plus.dart';

import '../types/types.dart';
import 'logg.dart';

Future<PackageInfo> getAppInfo() async => PackageInfo.fromPlatform();

extension PackageInfoToJson on PackageInfo {
  Json toJson() {
    return <String, dynamic>{
      'appName': appName,
      'buildNumber': buildNumber,
      'packageName': packageName,
      'version': version,
      'buildSignature': buildSignature,
      'installerStore': installerStore,
    };
  }

  String toPrettyString() {
    return prettyJson(toJson());
  }
}
