import 'package:flutter/foundation.dart';

abstract class Env {
  /// ? Temp env for the development stage (to hide some not ended things in the demo mode)
  static const bool isRealCMS = isDemo == false;
  static const bool isDemo = bool.fromEnvironment('IS_DEMO');
  static const bool isProduction = bool.fromEnvironment('IS_PRODUCTION') || kReleaseMode;
  static const bool simpleErrors = bool.fromEnvironment('SIMPLE_ERRORS');
  static const int errorDuration = int.fromEnvironment('ERROR_DURATION', defaultValue: 30);
  static const String analyticsKey = String.fromEnvironment('ANALYTICS_KEY');
  static const String analyticsProject = String.fromEnvironment('ANALYTICS_PROJECT');
}
