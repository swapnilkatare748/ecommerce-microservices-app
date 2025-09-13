import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Foreground
  static const Color foreground = Color.fromRGBO(255, 255, 255, 0.94);

  // Background
  static const Color background = Color(0xFFFBFBFB);
  static const Color transparent = Colors.transparent;

  // Brand (Primary)
  static const Color brandPrimary = Color(0xFFFBC392);

  // Icons
  static const Color iconLight = Color(0xFFF0F0F0);

  /// BG - This will be used for all kinds of background
  static const Color primary = Color(0xFF2837A3);
  static const Color secondary = Color(0xFF1C1B1A);

  /// Text
  static const Color text = Color(0xFF1F1F1F);

  // TextFormField
  static const Color disabledBg = Color(0xFFE1E1E1);
  static const Color errorRed = Color(0xFFFF0000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color textOne = Color(0xFF1F1F1F);
  static const Color textTwo = Color(0xFF1F1F1F);
}

extension AppColorsExt on Color {
  Color addOpacity(int percentage) => withValues(alpha: a * (percentage / 100));
}
