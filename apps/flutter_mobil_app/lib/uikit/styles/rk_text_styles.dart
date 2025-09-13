import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:flutter/material.dart';

class RKTextStyle {
  const RKTextStyle._(this.style);

  RKTextStyle copyWith({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
  }) {
    return RKTextStyle._(
      style.copyWith(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        decoration: textDecoration,
      ),
    );
  }

  final TextStyle style;

  /// color: textOne
  ///
  /// fontSize: 40
  ///
  /// fontFamily: Poppins
  ///
  /// fontWeight: FontWeight.w600 (semiBold)
  static const RKTextStyle h1 = RKTextStyle._(
    TextStyle(
      color: AppColors.textOne,
      fontSize: 40,
      height: 52 / 40,
      fontFamily: kPoppinsFontFamily,
      fontWeight: RKFontWeight.regular400,
    ),
  );

  static const RKTextStyle h2 = RKTextStyle._(
    TextStyle(
      color: AppColors.textOne,
      fontSize: 28,
      height: 36 / 28,
      fontFamily: kPoppinsFontFamily,
      fontWeight: RKFontWeight.regular400,
    ),
  );

  static const RKTextStyle h3 = RKTextStyle._(
    TextStyle(
      color: AppColors.textOne,
      fontSize: 24,
      height: 28 / 24,
      fontFamily: kPoppinsFontFamily,
      fontWeight: RKFontWeight.regular400,
    ),
  );

  static const RKTextStyle h4 = RKTextStyle._(
    TextStyle(
      color: AppColors.textOne,
      fontSize: 18,
      height: 28 / 18,
      fontFamily: kPoppinsFontFamily,
      fontWeight: RKFontWeight.regular400,
    ),
  );

  static const RKTextStyle h5 = RKTextStyle._(
    TextStyle(
      color: AppColors.textOne,
      fontSize: 14,
      height: 16 / 14,
      fontFamily: kPoppinsFontFamily,
      fontWeight: RKFontWeight.regular400,
    ),
  );

  static const RKTextStyle h6 = RKTextStyle._(
    TextStyle(
      color: AppColors.textOne,
      fontSize: 12,
      height: 14 / 12,
      fontFamily: kPoppinsFontFamily,
      fontWeight: RKFontWeight.regular400,
    ),
  );

  // for Paragraph
  static const RKTextStyle paragraph1 = RKTextStyle._(
    TextStyle(
      color: AppColors.textOne,
      fontSize: 12,
      height: 22 / 12,
      fontFamily: kPoppinsFontFamily,
      fontWeight: RKFontWeight.regular400,
    ),
  );

  static const RKTextStyle paragraph2 = RKTextStyle._(
    TextStyle(
      color: AppColors.textOne,
      fontSize: 14,
      height: 26 / 14,
      fontFamily: kPoppinsFontFamily,
      fontWeight: RKFontWeight.regular400,
    ),
  );

  static const RKTextStyle paragraph3 = RKTextStyle._(
    TextStyle(
      color: AppColors.textOne,
      fontSize: 16,
      height: 28 / 16,
      fontFamily: kPoppinsFontFamily,
      fontWeight: RKFontWeight.regular400,
    ),
  );

  static const RKTextStyle paragraph4 = RKTextStyle._(
    TextStyle(
      color: AppColors.textOne,
      fontSize: 18,
      height: 28 / 18,
      fontFamily: kPoppinsFontFamily,
      fontWeight: RKFontWeight.regular400,
    ),
  );
}
