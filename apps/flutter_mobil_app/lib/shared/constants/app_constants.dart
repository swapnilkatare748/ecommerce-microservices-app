import 'package:flutter/foundation.dart';

class AppConstants {
  AppConstants._();

  static const String APP_ENV = String.fromEnvironment(
    'ENV',
    defaultValue: 'DEV',
  );
  static const bool IS_PRODUCTION =
      String.fromEnvironment("ENV", defaultValue: "DEV") == "PROD";
  static const bool IS_PRODUCTION_RELEASE = IS_PRODUCTION && kReleaseMode;
  static const bool IS_DEV_MODE = bool.fromEnvironment(
    "is_dev_mode",
    defaultValue: !IS_PRODUCTION_RELEASE,
  );
  static const bool IS_LOG_ENABLED = false;
}
