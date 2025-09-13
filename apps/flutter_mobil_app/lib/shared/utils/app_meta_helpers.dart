import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:feedbackdesign/api/models/app_meta.dart';
import 'package:feedbackdesign/shared/utils/app_client.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppMetaHelper {
  Future<AppMeta> init() async {
    final PackageInfo appInfo = await PackageInfo.fromPlatform();
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    return await _setMeta(appInfo, deviceInfo);
  }

  Future<AppMeta> _setMeta(
    PackageInfo appInfo,
    DeviceInfoPlugin deviceInfo,
  ) async {
    final String osVersion;
    int sdkInt = 0;
    final String os;

    if (AppClient.isAndroid) {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      osVersion = androidInfo.version.release;
      sdkInt = androidInfo.version.sdkInt;
      os = "android";
    } else if (AppClient.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      osVersion = iosInfo.systemVersion;
      os = "iOS";
    } else if (AppClient.isWeb) {
      final WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      osVersion = webBrowserInfo.platform ?? "0";
      os = "web";
    } else {
      osVersion = "0";
      os = Platform.operatingSystem;
    }

    return AppMeta(
      appInfo: AppInfo(
        packageName: appInfo.packageName,
        version: appInfo.version,
        buildNumber: int.parse(appInfo.buildNumber.replaceAll(".", "")),
      ),
      deviceInfo: DeviceInfo(
        osVersion: double.tryParse(osVersion),
        sdkInt: sdkInt,
        os: os,
      ),
    );
  }
}
