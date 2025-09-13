import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:flutter/material.dart';

class RKTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final String? errorText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color? bgColor;
  final bool fillBgColor;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final AppIcon? prefixIcon;
  final String? suffixIcon;
  final VoidCallback? onSuffixTap;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int maxLines;
  final EdgeInsetsGeometry contentPadding;
  final Function(String)? onChanged;

  const RKTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.labelStyle,
    this.hintText,
    this.errorText,
    this.hintStyle,
    this.textStyle,
    this.bgColor,
    this.fillBgColor = false,
    this.borderColor = AppColors.white,
    this.borderRadius = 4.0,
    this.borderWidth = 1.0,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null && labelText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              labelText!,
              style: labelStyle ?? RKTextStyle.paragraph1.style,
            ),
          ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: maxLines,
          style:
              textStyle ??
              RKTextStyle.paragraph2.style.copyWith(color: AppColors.white),
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
                hintStyle ??
                RKTextStyle.paragraph2.style.copyWith(
                  color: AppColors.textThree,
                ),
            errorText: errorText,
            filled: fillBgColor,
            fillColor: bgColor,
            contentPadding: contentPadding,
            prefixIcon: prefixIcon,
            suffixIcon:
                suffixIcon != null
                    ? GestureDetector(
                      onTap: onSuffixTap,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: AppIcon(suffixIcon!, color: AppColors.white),
                      ),
                    )
                    : RKSizedBox(),
            enabledBorder: _buildBorder(borderColor),
            focusedBorder: _buildBorder(borderColor),
            errorBorder: _buildBorder(AppColors.toastBgError),
            focusedErrorBorder: _buildBorder(AppColors.toastBgError),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: color, width: borderWidth),
    );
  }
}
