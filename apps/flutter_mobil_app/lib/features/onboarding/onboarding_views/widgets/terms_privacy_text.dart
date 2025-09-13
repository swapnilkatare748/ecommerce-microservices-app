import 'package:feedbackdesign/shared/constants/app_constants.dart';
import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndPrivacyText extends StatelessWidget {
  const TermsAndPrivacyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: RKPaddings.only(bottom: 4),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: RKTextStyle.paragraph2.style.copyWith(
            color: AppColors.white,
            fontWeight: RKFontWeight.medium500,
          ), // Default style
          children: [
            const TextSpan(text: "I agree to the Ra-rel "),
            TextSpan(
              text: "Terms & Conditions",
              style: RKTextStyle.paragraph2.style.copyWith(
                color: AppColors.primaryButton,
                fontWeight: RKFontWeight.medium500,
              ),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      // _openLinks(AppConstants.TERMS_URL);
                    },
            ),
            // const TextSpan(text: " and "),
            // TextSpan(
            //   text: "Privacy Policy",
            //   style: RKTextStyle.paragraph2.style.copyWith(
            //     color: AppColors.primaryButton,
            //     fontWeight: RKFontWeight.medium500,
            //   ),
            //   recognizer:
            //       TapGestureRecognizer()
            //         ..onTap = () {
            //           // _openLinks(AppConstants.PRIVACY_URL);
            //         },
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> _openLinks(String url) async {
    final Uri uri = Uri.parse(url);
    // if (await canLaunchUrl(uri)) {
    //   await launchUrl(uri, mode: LaunchMode.externalApplication);
    // } else {
    Toast.warning("Can't open this link");
    // }
  }
}
