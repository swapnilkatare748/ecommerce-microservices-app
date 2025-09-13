import 'package:feedbackdesign/uikit/animations/button_bounce_animation.dart';
import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:feedbackdesign/uikit/utils/rk_button_size.dart';
import 'package:feedbackdesign/uikit/utils/rk_button_text.dart';
import 'package:feedbackdesign/uikit/utils/rk_button_type.dart';
import 'package:flutter/material.dart';

class RKButton extends StatelessWidget {
  const RKButton({
    super.key,
    this.text = "",
    this.subtext,
    this.icon,
    this.padding,
    this.buttonBgColor,
    this.buttonTextColor,
    this.onPressed,
    this.size = RKButtonSize.regular,
  }) : _rkButtonType = RKButtonType.primary,
       borderColor = null;

  const RKButton.secondary({
    super.key,
    this.text = "",
    this.subtext,
    this.icon,
    this.padding,
    this.buttonBgColor,
    this.buttonTextColor,
    this.onPressed,
    this.size = RKButtonSize.regular,
  }) : _rkButtonType = RKButtonType.secondary,
       borderColor = null;

  const RKButton.outlined({
    super.key,
    this.borderColor,
    this.text = "",
    this.subtext,
    this.icon,
    this.padding,
    this.buttonBgColor,
    this.buttonTextColor,
    this.onPressed,
    this.size = RKButtonSize.regular,
  }) : _rkButtonType = RKButtonType.outlined;

  const RKButton.plain({
    super.key,
    this.text = "",
    this.subtext,
    this.icon,
    this.padding,
    this.buttonBgColor,
    this.buttonTextColor,
    this.onPressed,
    this.size = RKButtonSize.regular,
  }) : _rkButtonType = RKButtonType.plain,
       borderColor = null;

  RKButton.image({
    super.key,
    required String imagePath,
    required this.text,
    this.borderColor,
    this.buttonBgColor,
    this.padding,
    this.buttonTextColor,
    this.onPressed,
    this.size = RKButtonSize.regular,
  }) : _rkButtonType = RKButtonType.image,
       icon = AppIcon(imagePath),
       subtext = null;

  final String? text;
  final String? subtext;
  final Widget? icon;
  final VoidCallback? onPressed;
  final RKButtonType _rkButtonType;
  final RKButtonSize size;
  final Color? borderColor;
  final Color? buttonBgColor;
  final Color? buttonTextColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = _getBackgroundColor();
    final Color foregroundColor = _getForegroundColor();

    return ButtonBounceAnimation(
      onPressed: onPressed,
      shouldSupportEnterKey: _rkButtonType == RKButtonType.primary,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: size.width,
        constraints: BoxConstraints(minHeight: size.height),
        padding:
            padding ??
            EdgeInsets.symmetric(
              horizontal: 16,
              vertical: _getVerticalPadding(),
            ),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: _getBorder(),
          borderRadius: BorderRadius.circular(kButtonRadius),
        ),
        child: _buildContent(foregroundColor),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (_rkButtonType) {
      case RKButtonType.primary:
        return buttonBgColor ?? AppColors.primaryButton;
      case RKButtonType.secondary:
        return buttonBgColor ?? AppColors.secondaryButton;
      case RKButtonType.outlined:
        return buttonBgColor ?? AppColors.buttonBgOutlined;
      case RKButtonType.plain:
        return AppColors.transparent;
      case RKButtonType.image:
        return buttonBgColor ?? AppColors.secondaeyYellowButton;
    }
  }

  Color _getForegroundColor() {
    switch (_rkButtonType) {
      case RKButtonType.primary:
        return buttonTextColor ?? AppColors.buttonTextPrimary;
      case RKButtonType.secondary:
        return buttonTextColor ?? AppColors.textTwo;
      case RKButtonType.outlined:
        return buttonTextColor ?? AppColors.buttonTextOutlined;
      case RKButtonType.plain:
        return buttonTextColor ?? AppColors.buttonTextPlain;
      case RKButtonType.image:
        return buttonTextColor ?? AppColors.white;
    }
  }

  Widget _buildContent(Color foregroundColor) {
    if (_rkButtonType == RKButtonType.image) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[icon!, const SizedBox(width: 8)],
          Flexible(
            child: Text(
              text ?? "",
              style: TextStyle(
                color: foregroundColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: kPoppinsFontFamily,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    return Center(
      child: RKButtonText(text: text ?? "", color: foregroundColor),
    );
  }

  BoxBorder? _getBorder() {
    if (_rkButtonType == RKButtonType.outlined ||
        _rkButtonType == RKButtonType.image) {
      return Border.all(
        color:
            borderColor ??
            (_rkButtonType == RKButtonType.outlined
                ? AppColors.buttonTextOutlined
                : AppColors.textThree),
        width: 1,
      );
    }
    return null;
  }

  double _getVerticalPadding() {
    switch (_rkButtonType) {
      case RKButtonType.outlined:
        return 8.0;
      case RKButtonType.image:
        return 10;
      default:
        return 14.0;
    }
  }
}
