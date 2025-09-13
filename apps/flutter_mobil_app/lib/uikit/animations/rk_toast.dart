import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:flutter/material.dart';


class RKToast extends StatelessWidget {
  const RKToast.success({
    super.key,
    required this.text,
  })  : _backgroundColor = AppColors.toastBgNormal,
        iconName = "ic_check_mark";

  const RKToast.normal({
    super.key,
    required this.text,
  })  : _backgroundColor = AppColors.toastBgNormal,
        iconName = null;

  const RKToast.warning({
    super.key,
    required this.text,
  })  : _backgroundColor = AppColors.toastBgWarning,
        iconName = null;

  const RKToast.error({
    super.key,
    required this.text,
  })  : _backgroundColor = AppColors.toastBgError,
        iconName = null;

  final String text;
  final Color _backgroundColor;
  final String? iconName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: iconName != null ? 6 : 10.0,
      ),
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: _backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: RKText(
              text,
              style: RKTextStyle.h5,
              textAlign: TextAlign.center,
              color: AppColors.white,
              fontWeight: RKFontWeight.semibold600,
            ),
          ),
        ],
      ),
    );
  }
}
