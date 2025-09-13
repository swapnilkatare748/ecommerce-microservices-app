import 'package:feedbackdesign/features/onboarding/onboarding_view_model.dart';
import 'package:feedbackdesign/features/onboarding/onboarding_views/widgets/other_login_options.dart';
import 'package:feedbackdesign/shared/constants/app_assets.dart';
import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:feedbackdesign/uikit/widgets/bg_color_ui.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnboardingWelcomeScreen extends StatelessWidget {
  const OnboardingWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      onViewModelReady: (viewModel) {
        viewModel.init();
      },
      viewModelBuilder: () => OnboardingViewModel(),
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
                  RKText(
                    'Welcome to',
                    style: RKTextStyle.h3,
                    fontWeight: RKFontWeight.medium500,
                    color: AppColors.welcomText,
                  ),
                  RKSizedBox.h16(),
                  RKText(
                    'Ra-rel !',
                    style: RKTextStyle.h1,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryButton,
                  ),
                  RKSizedBox.h16(),
                  RKText(
                    'Rate . Review . Relish',
                    style: RKTextStyle.h5,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                  RKSizedBox.h16(),
                  Center(
                    child: AppIcon.image(
                      AppAssets.IMG_WELCOME_MAN,
                      height: 120,
                    ),
                  ),
                  RKSizedBox.h16(),
                  buildLoginForm(viewModel),
                  RKSizedBox.h20(),
                  Center(
                    child: RKText(
                      'OR Sign In With',
                      style: RKTextStyle.h5,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  RKSizedBox.h20(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          viewModel.onLoginWithGoogleTap();
                        },
                        child: Center(
                          child: AppIcon.image(
                            AppAssets.IC_GOOGLE,
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                      const RKSizedBox.w16(),
                      GestureDetector(
                        onTap: () {
                          viewModel.onLoginWithFacebookTap();
                        },
                        child: Center(
                          child: AppIcon.image(
                            AppAssets.IC_FACEBOOK,
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                    ],
                  ),

                  RKSizedBox.h16(),
                  OtherLoginOptions(
                    loginLabel: 'Don’t have an account?',
                    loginActionLabel: 'Create Now',
                    isSignupRedirect: true,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  buildLoginForm(OnboardingViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RKSizedBox.h24(),

          // Email Field
          RKTextFormField(
            hintText: 'Enter mobile number or email address',
            labelText: '',
            controller: viewModel.emailTEC,
            errorText: viewModel.emailError,
            keyboardType: TextInputType.emailAddress,
            onChanged: (_) => {},
          ),
          const RKSizedBox.h16(),

          // Password Field
          RKTextFormField(
            hintText: 'Enter password',
            labelText: '',
            controller: viewModel.passwordTEC,
            errorText: viewModel.passwordError,
            obscureText: !viewModel.isPasswordVisible, // 👈 toggle visibility
            suffixIcon:
                viewModel.isPasswordVisible
                    ? AppAssets
                        .IMG_EYE_OPEN // 👁 visible icon
                    : AppAssets.IC_EYE_HIDDEN, // 👁‍🗨 hidden icon
            onSuffixTap: () {
              viewModel.isPasswordVisible = !viewModel.isPasswordVisible;
            },
            onChanged: (_) => {},
          ),

          const RKSizedBox.h4(),

          // Forgot Password
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: viewModel.onForgetPasswordTap,
              child: const RKText(
                'Forgot password?',
                style: RKTextStyle.paragraph3,
                color: AppColors.primaryButton,
              ),
            ),
          ),
          const RKSizedBox.h24(),

          // Login Button
          RKButton(onPressed: viewModel.onLoginTap, text: 'Sign In'),
          const RKSizedBox.h24(),
        ],
      ),
    );
  }
}
