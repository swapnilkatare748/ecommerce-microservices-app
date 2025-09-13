import 'package:feedbackdesign/uikit/styles/app_colors.dart';
import 'package:feedbackdesign/uikit/styles/rk_text_styles.dart';
import 'package:flutter/material.dart';

class RKText extends StatelessWidget {
  const RKText(
    this.text, {
    super.key,
    required this.style,
    this.color = AppColors.textOne,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.textDecoration,
  });

  final String text;
  final RKTextStyle style;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.style.copyWith(
        color: color,
        decoration: textDecoration,
        decorationColor: color,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
