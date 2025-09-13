import 'package:feedbackdesign/api/models/app_meta.dart';
import 'package:feedbackdesign/shared/constants/app_routes.dart';
import 'package:feedbackdesign/shared/routes/route_helper.dart';
import 'package:feedbackdesign/shared/utils/app_client.dart';
import 'package:feedbackdesign/shared/utils/pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:network_inspector/network_inspector.dart';

class Globals {
  Globals._();
  static late final bool isDevMode;
  static late final String appStoreID;

  static init(bool isDevMode) {
    Globals.isDevMode = isDevMode;
    if (isDevMode && AppClient.isMobile) {
      NetworkInspector.initialize();
    }
  }

  static final GlobalKey<NavigatorState> routeNavigatorKey =
      GlobalKey<NavigatorState>();
  static late AppMeta appMeta;
  static DateTime? lastActiveSessionDateTime = DateTime.now();
  static DateTime? lastBiometricAuthorizedDateTime = DateTime.now();

  static void clear() {
    lastActiveSessionDateTime = null;
    lastBiometricAuthorizedDateTime = null;
  }

  static Future logout() async {
    Globals.clear();
    await PrefHelper.clearAll();
    await PrefHelper.reload();
    RouteHelper.pushAndPopUntil(AppRoutes.SPLASH);
  }

  static onBackPressed() {
    if (RouteHelper.canPop()) {
      RouteHelper.pop();
    }
  }
}
