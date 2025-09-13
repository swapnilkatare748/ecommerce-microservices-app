import 'package:feedbackdesign/app.dart';
import 'package:feedbackdesign/shared/constants/app_routes.dart';
import 'package:feedbackdesign/shared/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  String? emailError;
  final emailTEC = TextEditingController();
  ForgotPasswordViewModel() {
    // Initialization code can go here if needed
  }

  // Add any methods or properties needed for the view model
  void onForgotPasswordButtonPressed() {
    // Logic to handle forgot password action
  }
  init() {}
  onSendOtpTap() {
    RouteHelper.push(AppRoutes.OTP_SCREEN, args: emailTEC.text.trim());
  }

  onBackButtonPressed() {
    RouteHelper.pop();
  }
}
