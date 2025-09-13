import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:feedbackdesign/uikit/utils/constants.dart';
import 'package:flutter/material.dart';


class RKSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextStyle? hintStyle;
  final double borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final AppIcon? prefixIcon;
  final EdgeInsetsGeometry contentPadding;
  final ValueChanged<String>? onChanged;

  const RKSearchBar({
    super.key,
    this.controller,
    this.hintText = "Search",
    this.hintStyle,
    this.borderRadius = 4,
    this.borderColor = AppColors.textThree,
    this.backgroundColor = AppColors.background,
    this.prefixIcon = const AppIcon("$kAssetsIcons/ic_search.svg", size: 24),
    this.contentPadding = const EdgeInsets.only(left: 12, top: 8, bottom: 8),
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: prefixIcon,
          ),
          hintText: hintText,
          hintStyle: hintStyle ??
              RKTextStyle.paragraph2.copyWith(color: AppColors.textThree).style,
          border: InputBorder.none,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
        ),
      ),
    );
  }
}
