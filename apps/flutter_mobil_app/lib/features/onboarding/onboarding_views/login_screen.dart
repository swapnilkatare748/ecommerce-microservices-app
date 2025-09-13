import 'package:feedbackdesign/features/onboarding/onboarding_view_model.dart';
import 'package:feedbackdesign/shared/constants/app_assets.dart';
import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:feedbackdesign/uikit/widgets/bg_color_ui.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      onViewModelReady: (viewModel) {
        viewModel.init();
      },
      viewModelBuilder: () => OnboardingViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: RKActionBar(),
          body: FancyBackground(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RKSizedBox.h24(),
                Expanded(child: _buildBody(viewModel)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(OnboardingViewModel viewModel) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RKText(
                'Login',
                style: RKTextStyle.h3,
                fontWeight: RKFontWeight.medium500,
              ),
              const RKSizedBox.h16(),
              const RKText(
                'Login to your Roptia account',
                style: RKTextStyle.paragraph3,
              ),
              const RKSizedBox.h24(),

              // Email Field
              RKTextFormField(
                hintText: 'Enter email address',
                labelText: 'Email Address',
                controller: viewModel.emailTEC,
                errorText: viewModel.emailError,
                keyboardType: TextInputType.emailAddress,
                onChanged: (_) => {},
              ),
              const RKSizedBox.h16(),

              // Password Field
              RKTextFormField(
                hintText: 'Enter password',
                labelText: 'Password',
                controller: viewModel.passwordTEC,
                errorText: viewModel.passwordError,
                obscureText:
                    !viewModel.isPasswordVisible, // 👈 toggle visibility
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
                    color: AppColors.primary,
                  ),
                ),
              ),
              const RKSizedBox.h24(),

              // Login Button
              RKButton(onPressed: viewModel.onSubmitTap, text: 'Log In'),
              const RKSizedBox.h24(),
            ],
          ),
        ),
      ),
    );
  }
}
