import 'package:feedbackdesign/features/forgot_password/forgot_password_viewmodel.dart';
import 'package:feedbackdesign/shared/constants/constants.dart';
import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:feedbackdesign/uikit/widgets/bg_color_ui.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
      onViewModelReady: (viewModel) {
        viewModel.init();
      },
      viewModelBuilder: () => ForgotPasswordViewModel(),
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
                    'Lost your password?\nlet’s get you back in!',
                    style: RKTextStyle.h2,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                  RKSizedBox.h32(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: AppIcon.image(
                      AppAssets.IMG_CONFUZED_MAN,
                      height: 160,
                    ),
                  ),

                  const RKSizedBox.h32(),

                  RKText(
                    """Please enter the email address or mobile number associated with the account. We will send verification code to reset your password.""",
                    style: RKTextStyle.h5,
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
                  RKTextFormField(
                    hintText: 'Enter mobile number or email address',
                    labelText: '',
                    controller: viewModel.emailTEC,
                    errorText: viewModel.emailError,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (_) => {},
                  ),
                  RKSizedBox.h32(),
                  RKButton(onPressed: viewModel.onSendOtpTap, text: 'Send OTP'),
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
