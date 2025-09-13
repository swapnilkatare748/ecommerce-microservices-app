import 'dart:io';

import 'package:feedbackdesign/api/api_exceptions.dart';
import 'package:feedbackdesign/api/models/base_response.dart';
import 'package:feedbackdesign/features/onboarding/onboarding_views/models/login_response.dart';
import 'package:feedbackdesign/shared/constants/app_routes.dart';
import 'package:feedbackdesign/shared/constants/pref_keys.dart';
import 'package:feedbackdesign/shared/utils/image_picker_service.dart';
import 'package:feedbackdesign/shared/utils/utils.dart';
import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnboardingViewModel extends BaseViewModel {
  ApiService apiService = ApiService();
  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? emailError;
  String? passwordError;
  bool isPasswordVisible = false;
  bool isTermsAccepted = false;
  bool isPickingImage = false;
  File imageFile = File('');
  String imageBase64 = "";
  String selectedBusinessType = "";
  List<String> businessTypeList = ["Individual", "Business"];
  String selectedDesignation = "";
  List<String> designationList = ["Manager", "Supervisor", "Employee"];
  Future changeDesignation(String value) async {
    selectedDesignation = value;
    notifyListeners();
  }

  Future changeBusinessType(String value) async {
    selectedBusinessType = value;
    notifyListeners();
  }

  Future onSelectImageTap() async {
    if (isPickingImage) return; // Prevent re-entry

    isPickingImage = true;

    notifyListeners();

    try {
      await ImagePickerService.pickImage((File file, String base64) {
        imageFile = file;
        imageBase64 = base64;
        notifyListeners();
      });
    } catch (e) {
      // Optional: show toast or log error
    } finally {
      isPickingImage = false;
      notifyListeners();
    }
  }

  final GlobalKey<RKDropdownState> businessTypeDropdownKey =
      GlobalKey<RKDropdownState>();
  final GlobalKey<RKDropdownState> designationDropdownKey =
      GlobalKey<RKDropdownState>();
  final confirmPasswordTEC = TextEditingController();
  final firstNameTEC = TextEditingController();
  final lastNameTEC = TextEditingController();
  final streetTEC = TextEditingController();
  final cityTEC = TextEditingController();
  final pincodeTEC = TextEditingController();

  String? confirmPasswordError;
  String? firstNameError;
  String? lastNameError;
  String? streetError;
  String? cityError;
  String? pincodeError;
  bool isConfirmPasswordVisible = false;
  init() {
    // Initialize any necessary data or state here
  }

  Future onForgetPasswordTap() async {
    passwordTEC.clear();
    RouteHelper.push(
      AppRoutes.FORGOT_PASSWORD_SCREEN,
      args: emailTEC.text.trim(),
    );
  }

  Future onSubmitTap() async {
    emailError = validateEmail(emailTEC.text);
    passwordError = validatePassword(passwordTEC.text);

    if (emailError == null && passwordError == null) {
      await login(emailTEC.text, passwordTEC.text);
    }
  }

  Future onLoginTap() async {
    // Clear the text fields
    emailTEC.clear();
    passwordTEC.clear();

    // Navigate to the signup screen
    RouteHelper.push(AppRoutes.DASHBOARD_SCREEN);
  }

  Future onLoginWithGoogleTap() async {
    // Handle Google login logic here
  }
  Future onLoginWithAppleTap() async {
    // Handle Apple login logic here
  }
  Future onLoginWithFacebookTap() async {
    // Handle Facebook login logic here
  }
  Future<void> onSignupSubmitTap() async {
    // Validate only on button click
    emailError = validateEmail(emailTEC.text);
    passwordError = validatePassword(passwordTEC.text);
    confirmPasswordError = validateConfirmPassword(
      confirmPasswordTEC.text,
      passwordTEC.text,
    );
    firstNameError = validateField(firstNameTEC.text, 'First Name');
    lastNameError = validateField(lastNameTEC.text, 'Last Name');

    // If no errors, proceed with registration
    if (emailError == null &&
        passwordError == null &&
        confirmPasswordError == null &&
        firstNameError == null &&
        lastNameError == null &&
        streetError == null &&
        cityError == null &&
        pincodeError == null) {
      final requestBody = {
        "firstName": firstNameTEC.text.trim(),
        "lastName": lastNameTEC.text.trim(),
        "email": emailTEC.text.trim(),
        "encryptPassword": passwordTEC.text.trim(),
        "confirmPassword": confirmPasswordTEC.text.trim(),
        "postCode": pincodeTEC.text.trim(),
        "referralCode": "",
        "street": streetTEC.text.trim(),
        "city": cityTEC.text.trim(),
        "country": "India",
        "acceptTerms": true,
        "acceptNewsLetter": true,
        "OfferCode": "",
        "roleIds": "4",
      };
      print(requestBody);
      await register(requestBody);
    }
  }

  Future login(String email, String password) async {
    RKOverlayView.showLoaderWithSuccess<LoginResponse>(
      future: () => ApiService().login(email, password),
      onSuccess:
          (LoginResponse loginResponse) => {
            PrefHelper.setValue(PrefKeys.TOKEN, loginResponse.token ?? ''),
            PrefHelper.setValue(
              PrefKeys.REFRESH_TOKEN,
              loginResponse.refreshToken ?? '',
            ),
          },
      onError: (Object error) {
        if (error is ErrorResponseException) {
          Toast.error(error.message ?? "Something went wrong.");
          return;
        }
      },
    );
  }

  Future register(JsonMap body) async {
    RKOverlayView.showLoaderWithSuccess<BaseResponse>(
      future: () => apiService.register(body),
      onSuccess:
          (BaseResponse baseResponse) => {
            Toast.success(baseResponse.message ?? 'Something went wrong.'),
            RouteHelper.pushReplacement(
              AppRoutes.LOGIN_SCREEN,
              args: body['email'],
            ),
          },
      onError: (Object error) {
        if (error is ErrorResponseException) {
          Toast.error(error.message ?? "Something went wrong.");
          return;
        } else {
          print(error);
          Toast.error('Something went wrong.');
        }
      },
    );
  }

  Future forgetPassword(String email) async {
    RKOverlayView.showLoaderWithSuccess<BaseResponse>(
      future: () => apiService.forgetPassword(email),
      onSuccess:
          (BaseResponse baseResponse) => {
            Toast.success(baseResponse.message ?? "Something went wrong."),
            RouteHelper.pop(),
          },
      onError: (Object error) {
        if (error is ErrorResponseException) {
          Toast.error(error.data ?? "Something went wrong.");
          return;
        } else {
          print(error);
          Toast.error('Something went wrong.');
        }
      },
    );
  }

  String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Please enter your email';
    } else if (!AppValidators.isEmail(email)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password cannot be empty';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String confirmPassword, String password) {
    if (confirmPassword.isEmpty) {
      return 'Confirm Password cannot be empty';
    } else if (confirmPassword != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validateField(String value, String fieldName) {
    if (value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }
}
