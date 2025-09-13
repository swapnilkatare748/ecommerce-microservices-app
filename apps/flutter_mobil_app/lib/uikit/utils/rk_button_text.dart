import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:flutter/material.dart';

class RKButtonText extends StatelessWidget {
  const RKButtonText({
    super.key,
    required this.text,
    this.color = AppColors.buttonTextPrimary,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: kPoppinsFontFamily,
        height: 18 / 18,
      ),
      textAlign: TextAlign.center,
    );
  }
}
