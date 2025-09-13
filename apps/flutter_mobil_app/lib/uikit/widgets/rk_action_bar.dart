import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:feedbackdesign/uikit/utils/rk_action_bar_type.dart';
import 'package:flutter/material.dart';

class RKActionBar extends StatelessWidget implements PreferredSizeWidget {
  const RKActionBar({
    super.key,
    this.type = RKActionBarType.iconOnly,
    this.backgroundColor = Colors.white,
    this.actionImage = '$kAssetsIcons/ic_roptia_logo.svg',
    this.preferredSize = const Size.fromHeight(kToolbarHeight),
  }) : titleText = null,
       label = null;

  const RKActionBar.custom({
    super.key,
    required this.titleText,
    this.label,
    this.actionImage,
    this.backgroundColor = AppColors.primary,
    this.preferredSize = const Size.fromHeight(146),
  }) : type = RKActionBarType.custom;

  final RKActionBarType type;
  final String? titleText;
  final String? label;
  final Color backgroundColor;
  final String? actionImage;
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case RKActionBarType.iconOnly:
        return AppBar(
          backgroundColor: AppColors.primary,
          centerTitle: true,
          title: AppIcon.image(actionImage!),
          automaticallyImplyLeading: false,
        );

      case RKActionBarType.custom:
        return AppBar(
          backgroundColor: backgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: preferredSize.height,
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (label != null) ...[
                  Text(
                    label!,
                    style:
                        RKTextStyle.paragraph3
                            .copyWith(color: Colors.white)
                            .style,
                  ),
                  RKSizedBox.h12(),
                ],
                Text(
                  titleText ?? '',
                  style:
                      RKTextStyle.h3
                          .copyWith(
                            fontWeight: RKFontWeight.medium500,
                            color: Colors.white,
                          )
                          .style,
                ),
              ],
            ),
          ),
          actions: [
            if (actionImage != null)
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: ClipOval(
                  child: AppIcon(actionImage!, size: 40, fit: BoxFit.cover),
                ),
              ),
          ],
        );
    }
  }
}
