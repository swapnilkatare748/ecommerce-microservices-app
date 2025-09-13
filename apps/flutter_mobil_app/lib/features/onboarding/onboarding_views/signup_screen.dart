import 'package:feedbackdesign/app.dart';
import 'package:feedbackdesign/features/onboarding/onboarding_view_model.dart';
import 'package:feedbackdesign/features/onboarding/onboarding_views/widgets/other_login_options.dart';
import 'package:feedbackdesign/features/onboarding/onboarding_views/widgets/terms_privacy_text.dart';
import 'package:feedbackdesign/shared/constants/app_assets.dart';
import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:feedbackdesign/uikit/widgets/bg_color_ui.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [RKSizedBox.h24(), _buildBody(viewModel)],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(OnboardingViewModel viewModel) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: viewModel.formKey,
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            // mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RKSizedBox.h32(),
              const RKSizedBox.h16(),
              const RKText(
                "New here? Let's\nmake it official! 🎉",
                style: RKTextStyle.h3,
                fontWeight: RKFontWeight.medium500,
                color: AppColors.welcomText,
              ),
              const RKSizedBox.h16(),
              AppIcon.image(AppAssets.IMG_LETS_GO_MAN, height: 120),
              const RKSizedBox.h24(),
              _buildTextField(
                viewModel,
                viewModel.firstNameTEC,
                'First Name',
                'Enter first name',
                errorText: viewModel.firstNameError,
              ),
              _buildTextField(
                viewModel,
                viewModel.lastNameTEC,
                'Last Name',
                'Enter last name',
                errorText: viewModel.lastNameError,
              ),
              _buildTextField(
                viewModel,
                viewModel.emailTEC,
                'Email',
                'Enter email address',
                isEmail: true,
                errorText: viewModel.emailError,
              ),
              _buildTextField(
                viewModel,
                viewModel.passwordTEC,
                'Password',
                'Enter password',
                isPassword: true,
                errorText: viewModel.passwordError,
              ),
              _buildTextField(
                viewModel,
                viewModel.confirmPasswordTEC,
                'Confirm Password',
                'Enter password',
                isPassword: true,
                errorText: viewModel.confirmPasswordError,
              ),
              _buildTextField(
                viewModel,
                viewModel.streetTEC,
                'Phone Number',
                'Enter phone number',
                errorText: viewModel.streetError,
              ),
              _buildTextField(
                viewModel,
                viewModel.cityTEC,
                'Business Name',
                'Enter business name',
                errorText: viewModel.cityError,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: RKText(
                  "Business Type",
                  style: RKTextStyle.paragraph2,
                  fontWeight: RKFontWeight.medium500,
                  color: AppColors.welcomText,
                ),
              ),
              RKDropdown(
                hintText: 'Select business type',
                key: viewModel.businessTypeDropdownKey,
                selectedValue: viewModel.selectedBusinessType,
                items: viewModel.businessTypeList,
                onChanged: (value) {
                  if (value != null) {
                    viewModel.changeBusinessType(value);
                  }
                },
              ),
              RKSizedBox.h16(),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: RKText(
                  "Designation",
                  style: RKTextStyle.paragraph2,
                  fontWeight: RKFontWeight.medium500,
                  color: AppColors.welcomText,
                ),
              ),
              RKDropdown(
                hintText: 'Select designation',
                key: viewModel.designationDropdownKey,
                selectedValue: viewModel.selectedDesignation,
                items: viewModel.designationList,
                onChanged: (value) {
                  if (value != null) {
                    viewModel.changeBusinessType(value);
                  }
                },
              ),
              RKSizedBox.h16(),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: RKText(
                  "Business Logo",
                  style: RKTextStyle.paragraph2,
                  fontWeight: RKFontWeight.medium500,
                  color: AppColors.welcomText,
                ),
              ),
              RKSizedBox.h16(),
              GestureDetector(
                onTap: () {
                  viewModel.onSelectImageTap();
                },
                child: Container(
                  color: AppColors.textThree,
                  height: 150,
                  width: 150,
                  margin: RKPaddings.only(right: 180),
                  child:
                      viewModel.imageBase64.isNotEmpty
                          ? Image.file(viewModel.imageFile, fit: BoxFit.cover)
                          : Icon(Icons.image, size: 50),
                ),
              ),
              RKSizedBox.h16(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    activeColor: AppColors.primaryButton,
                    checkColor: AppColors.white,
                    value: viewModel.isTermsAccepted,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    side: const BorderSide(color: AppColors.white, width: 1),
                    onChanged: (value) {
                      setState(() {
                        viewModel.isTermsAccepted = value ?? false;
                      });
                    },
                  ),
                  const TermsAndPrivacyText(),
                ],
              ),
              const RKSizedBox.h16(),
              RKButton.image(
                onPressed: viewModel.onSignupSubmitTap,
                imagePath: AppAssets.IC_SCAN_BUSINESS_CARD,
                text: 'Scan to Auto-fill',
              ),
              const RKSizedBox.h16(),
              RKButton(onPressed: viewModel.onSignupSubmitTap, text: 'Sign Up'),
              const RKSizedBox.h24(),
              OtherLoginOptions(
                loginLabel: 'Already have an account?',
                loginActionLabel: 'Login Now',
                isSignupRedirect: false,
              ),
              const RKSizedBox.h24(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    OnboardingViewModel viewModel,
    TextEditingController controller,
    String label,
    String hint, {
    bool isEmail = false,
    bool isPassword = false,
    bool isNumber = false,
    String? errorText,
  }) {
    bool obscureText =
        isPassword &&
        ((label == 'Password' && !viewModel.isPasswordVisible) ||
            (label == 'Confirm Password' &&
                !viewModel.isConfirmPasswordVisible));

    String? suffixIcon =
        isPassword
            ? ((label == 'Password' && !viewModel.isPasswordVisible) ||
                    (label == 'Confirm Password' &&
                        !viewModel.isConfirmPasswordVisible))
                ? AppAssets.IC_EYE_HIDDEN
                : AppAssets.IMG_EYE_OPEN
            : null;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: RKTextFormField(
        hintText: hint,
        labelText: label,
        labelStyle: TextStyle(fontSize: 14, color: AppColors.white),
        controller: controller,
        errorText: errorText,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        obscureText: obscureText,
        suffixIcon: suffixIcon,
        onSuffixTap:
            isPassword
                ? () {
                  setState(() {
                    if (label == 'Password') {
                      viewModel.isPasswordVisible =
                          !viewModel.isPasswordVisible;
                    } else if (label == 'Confirm Password') {
                      viewModel.isConfirmPasswordVisible =
                          !viewModel.isConfirmPasswordVisible;
                    }
                  });
                }
                : null,
        onChanged: (_) {
          setState(() {
            if (label == 'Email') viewModel.emailError = null;
            if (label == 'Password') viewModel.passwordError = null;
            if (label == 'Confirm Password')
              viewModel.confirmPasswordError = null;
            if (label == 'First Name') viewModel.firstNameError = null;
            if (label == 'Last Name') viewModel.lastNameError = null;
            if (label == 'Street') viewModel.streetError = null;
            if (label == 'City') viewModel.cityError = null;
            if (label == 'Pincode') viewModel.pincodeError = null;
          });
        },
      ),
    );
  }
}
