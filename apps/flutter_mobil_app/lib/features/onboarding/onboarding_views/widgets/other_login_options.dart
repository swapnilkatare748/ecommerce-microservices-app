import 'package:feedbackdesign/shared/constants/app_routes.dart';
import 'package:feedbackdesign/shared/utils/utils.dart';
import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:flutter/material.dart';

class OtherLoginOptions extends StatelessWidget {
  const OtherLoginOptions({
    super.key,
    required this.loginLabel,
    required this.loginActionLabel,
    required this.isSignupRedirect,
  });

  final String loginLabel;
  final String loginActionLabel;
  final bool isSignupRedirect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RKText(
              loginLabel,
              style: RKTextStyle.paragraph2,
              fontWeight: RKFontWeight.medium500,
              color: AppColors.white,
            ),
            RKSizedBox.w6(),
            GestureDetector(
              onTap: _onLoginActionTap,
              child: RKText(
                loginActionLabel,
                style: RKTextStyle.paragraph2,
                fontWeight: RKFontWeight.medium500,
                color: AppColors.primaryButton,
              ),
            ),
          ],
        ),
        const RKSizedBox.h16(),
        /*  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                color: AppColors.divider1,
                height: 1, // Line height
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const RKText(
                'Or Continue With',
                style: RKTextStyle.paragraph2,
              ),
            ),
            Expanded(
              child: Container(
                color: AppColors.divider1,
                height: 1, // Line height
              ),
            ),
          ],
        ),
        const RKSizedBox.h24(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: RKButton.image(
                imagePath: AppAssets.IC_GOOGLE,
                onPressed: _onGoogleSign,
              ),
            ),
            RKSizedBox.w20(),
            Expanded(
              child: RKButton.image(
                imagePath: AppAssets.IC_FB,
                onPressed: _onFBSign,
              ),
            ),
          ],
        ),
       */
      ],
    );
  }

  void _onLoginActionTap() {
    if (isSignupRedirect) {
      RouteHelper.pushReplacement(AppRoutes.SIGNUP_SCREEN);
    } else {
      RouteHelper.pushReplacement(AppRoutes.LOGIN_SCREEN);
    }
  }

  /*   
  void _onGoogleSign() {
    Toast.warning('Work in progress');
  }

  void _onFBSign() {
    Toast.warning('Work in progress');
  } */
}
