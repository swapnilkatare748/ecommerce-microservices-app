import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:flutter/material.dart';

class RKCard extends StatelessWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const RKCard.card1({
    super.key,
    this.child,
    this.borderColor = AppColors.divider1,
    this.borderRadius = 8.0,
    this.padding = const RKPaddings.a16(),
    this.margin,
  }) : backgroundColor = AppColors.background;

  const RKCard.card2({
    super.key,
    this.child,
    this.backgroundColor = AppColors.card2BgColor,
    this.borderRadius = 8.0,
    this.padding = const RKPaddings.a16(),
    this.margin,
  }) : borderColor = null;

  const RKCard.card3({
    super.key,
    this.child,
    this.backgroundColor = AppColors.card3BgColor,
    this.borderRadius = 8.0,
    this.padding = const RKPaddings.a16(),
    this.margin,
  }) : borderColor = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: child,
    );
  }
}
