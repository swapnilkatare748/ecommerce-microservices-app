import 'dart:io';

import 'package:dio/dio.dart';
import 'package:feedbackdesign/api/api_client.dart';
import 'package:feedbackdesign/shared/globals.dart';

import 'utils/utils.dart';
import 'constants/constants.dart';

class AppController {
  static final instance = AppController._();
  AppController._();

  Future init() async {
    //await _setupFirebase();
    await PrefHelper.init();

    Globals.init(AppConstants.IS_DEV_MODE);
    Globals.appMeta = await AppMetaHelper().init();

    ApiClient.init(
      baseURL: APIs.BASE_URL,
      tokenKey: PrefKeys.TOKEN,
      appMeta: Globals.appMeta,
      onUnauthorized: (String message, {int? statusCode}) {
        return Globals.logout();
      },
      interceptorsList: Interceptors(),
    );

    DeviceUtils.hideKeyboard();
  }

  // Show on Android 13+ and ios
  bool canAskNotificationPermission() =>
      (Platform.isAndroid && Globals.appMeta.deviceInfo.sdkInt >= 33) ||
      Platform.isIOS;

  Future<bool?> openEnableNotificationSheetIfNeeded() async {
    // if (canAskNotificationPermission() &&
    //     !await isNotificationPermissionGranted()) {}
    return false;
  }

  // Future<bool> isNotificationPermissionGranted() =>
  //     NotificationService().isGranted();

  /// Restart app if stays such longer in memory (especially on ios) on resume
  void validateOnResume() {
    if (Globals.lastActiveSessionDateTime != null) {
      final Duration differenceInSessionDuration = DateTime.now().difference(
        Globals.lastActiveSessionDateTime!,
      );

      // Check on every 6 hours
      final bool isSessionExpired =
          differenceInSessionDuration >= const Duration(hours: 2);
      if (isSessionExpired) {
        Globals.clear();
        RouteHelper.pushAndPopUntil(AppRoutes.SPLASH);
        Globals.lastActiveSessionDateTime = null;
        return; // This is important so it won't call biometric again
      }
    }

    // Ask pin every 1 hour on resume
    if (Globals.lastBiometricAuthorizedDateTime != null &&
        PrefHelper.containsKey(PrefKeys.TOKEN)) {
      final Duration differenceInBiometricDuration = DateTime.now().difference(
        Globals.lastBiometricAuthorizedDateTime!,
      );
      if (differenceInBiometricDuration >= const Duration(minutes: 30)) {
        Globals.lastBiometricAuthorizedDateTime = null;
        RouteHelper.push(AppRoutes.SPLASH);
      }
    }
  }
}
