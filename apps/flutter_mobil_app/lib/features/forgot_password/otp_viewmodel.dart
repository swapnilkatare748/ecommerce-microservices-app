import 'package:feedbackdesign/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OTPViewModel extends BaseViewModel {
  final TextEditingController emailTEC = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();

  @override
  void init() {}

  void onBackButtonPressed() {
    // Logic to handle back button press
    // For example, navigate to the previous screen
    RouteHelper.pop();
  }

  void verifyOTPCode() {
    // Logic to handle sending OTP
    // For example, navigate to the OTP screen with the email
  }
}
