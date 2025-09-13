import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Foreground
  static const Color foreground94 = Color.fromRGBO(255, 255, 255, 0.94);
  static const Color foreground70 = Color.fromRGBO(255, 255, 255, 0.70);
  static const Color foreground60 = Color.fromRGBO(255, 255, 255, 0.60);
  static const Color foreground50 = Color.fromRGBO(255, 255, 255, 0.50);
  static const Color foreground30 = Color.fromRGBO(255, 255, 255, 0.30);
  static const Color foreground16 = Color.fromRGBO(255, 255, 255, 0.16);
  static const Color foreground10 = Color.fromRGBO(255, 255, 255, 0.10);
  static const Color foreground8 = Color.fromRGBO(255, 255, 255, 0.08);
  static const Color foreground3 = Color.fromRGBO(255, 255, 255, 0.03);

  // Background
  static const Color background = Color(0xFFFBFBFB);
  static const Color transparent = Colors.transparent;

  // Brand (Primary)
  static const Color brandPrimary = Color(0xFFFBC392);

  // Icons
  static const Color iconLight = Color(0xFFF0F0F0);

  /// BG - This will be used for all kinds of background
  static const Color primary = Color(0xFF2837A3);
  static const Color primaryButton = Color(0xFFFF6E25);
  static const Color secondaeyYellowButton = Color(0xFFFAA813);
  static const Color secondaryButton = Color(0xFFBABABA);
  static const Color secondary = Color(0xFF1C1B1A);

  /// Text
  static const Color textOne = Color(0xFF1F1F1F);
  static const Color textTwo = Color(0xFF444444);
  static const Color textThree = Color(0xFFBBBBBB);
  static const Color welcomText = Color(0xFFACE3D3);

  // Button
  static const Color buttonTextPrimary = Color(0xFFFFFFFF);
  static const Color buttonTextSecondary = Color(0xFF64748B);
  static const Color buttonTextOutlined = Color(0xFF2837A3);
  static const Color buttonTextPlain = Color(0xFF2837A3);

  static const Color buttonBgPrimary = Color(0xFF2837A3);
  static const Color buttonBgSecondary = Color(0xFFE7EAEE);
  static const Color buttonBgOutlined = Color(0xFFFBFBFB);

  static const Color white = Color(0xFFFFFFFF);

  //Toast
  static const Color toastBgNormal = Color(0xFF121212);
  static const Color toastBgError = Color(0xFF9B2B42);
  static const Color toastBgWarning = Color(0xFFED8B35);

  /// Card
  static const Color cardZero = Color(0xFF161515);
  static const Color card2BgColor = Color(0xFFEFEFEF);
  static const Color card3BgColor = Color(0xFFFFFFFF);

  /// DropDown
  static const Color dropDownBorderColor = Color(0xFFDDDDDD);
  static const Color dropDownIconColor = Color(0xFF2D3657);
  static const Color dropDownTextColor = Color(0xFF887F7F);

  /// Divider - This has opacity
  static const Color dividerDarkest = Color.fromRGBO(255, 255, 255, 0.04);
  static const Color divider1 = Color(0xFFC6C6C6);

  /// Icon
  static const Color iconDarkest = Color(0xFF100F0F);

  /// Border - This has opacity
  static const Color borderLight = Color.fromRGBO(255, 255, 255, 0.04);
}

extension AppColorsExt on Color {
  Color addOpacity(int percentage) => withValues(alpha: a * (percentage / 100));
}
