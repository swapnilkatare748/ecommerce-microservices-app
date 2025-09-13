import 'dart:math';

import 'package:feedbackdesign/shared/utils/app_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceUtils {
  static late MediaQueryData _mediaQueryData;

  static Size get size => _mediaQueryData.size;

  // Threshold for phone/tablet can be adjusted
  static bool get isPhone => size.shortestSide < 600;
  static bool get isTablet =>
      size.shortestSide >= 600 && size.shortestSide < 900;
  static bool get isLargeTablet => size.shortestSide >= 900;

  static bool get isFoldable {
    // Rough heuristic — you can improve this using display features or aspect ratio
    final aspectRatio = size.aspectRatio;
    return isPhone && aspectRatio < 1.2; // Portrait foldable
  }

  static double get deviceHeight => size.height;
  static double get deviceWidth =>
      isPhone & isTablet ? size.width : min(800, size.width);

  static bool get hasIphoneBottomNotch =>
      AppClient.isIOS && _mediaQueryData.viewPadding.bottom > 0;

  static double get statusBarHeight => _mediaQueryData.padding.top;
  static double get navBarHeight => _mediaQueryData.padding.bottom;

  DeviceUtils(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
  }

  static Future hideKeyboard() {
    return SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static void removeFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void reFocus(FocusNode focusNode) {
    removeFocus();
    Future.delayed(const Duration(milliseconds: 50), () {
      focusNode.requestFocus();
    });
  }
}
