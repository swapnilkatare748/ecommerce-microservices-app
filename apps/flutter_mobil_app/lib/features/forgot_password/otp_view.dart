import 'package:feedbackdesign/features/forgot_password/otp_viewmodel.dart';
import 'package:feedbackdesign/shared/constants/constants.dart';
import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:feedbackdesign/uikit/widgets/bg_color_ui.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OTPView extends StatelessWidget {
  final String email;

  const OTPView({super.key, required this.email});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OTPViewModel>.reactive(
      onViewModelReady: (viewModel) {
        viewModel.init();
      },
      viewModelBuilder: () => OTPViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: FancyBackground(
            child: Container(
              padding: RKPaddings.a16(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  RKSizedBox.h32(),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.welcomText,
                    ),
                    onPressed: viewModel.onBackButtonPressed,
                  ),
                  RKSizedBox.h16(),
                  RKText(
                    'Ding!\nYour code has arrived',
                    style: RKTextStyle.h2,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                  RKSizedBox.h32(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: AppIcon.image(
                      AppAssets.IMG_EXCITED_MAN,
                      height: 160,
                    ),
                  ),

                  const RKSizedBox.h32(),

                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: RKTextStyle.h2.style.copyWith(
                        color: AppColors.white,
                        fontWeight: RKFontWeight.medium500,
                      ), // Default style
                      children: [
                        const TextSpan(text: "Verify your "),
                        TextSpan(
                          text: "Email",
                          style: RKTextStyle.h2.style.copyWith(
                            color: AppColors.primaryButton,
                            fontWeight: RKFontWeight.medium500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const RKSizedBox.h32(),
                  RKText(
                    "A Verification code has been sent to\n$email, enter it below",
                    style: RKTextStyle.paragraph1,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),

                  const RKSizedBox.h32(),
                  RKText(
                    "Reset Password",
                    style: RKTextStyle.h4,
                    fontWeight: RKFontWeight.medium500,
                    color: AppColors.white,
                  ),
                  const RKSizedBox.h16(),
                  // Email Field
                  // RKTextFormField(
                  //   hintText: 'Enter mobile number or email address',
                  //   labelText: '',
                  //   controller: viewModel.emailTEC,
                  //   errorText: viewModel.emailError,
                  //   keyboardType: TextInputType.emailAddress,
                  //   onChanged: (_) => {},
                  // ),
                  RKSizedBox.h32(),
                  RKButton(
                    onPressed: viewModel.verifyOTPCode,
                    text: 'Verify Code',
                  ),
                  const RKSizedBox.h24(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
