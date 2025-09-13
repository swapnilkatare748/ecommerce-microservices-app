import 'package:feedbackdesign/features/forgot_password/forgot_password_view.dart';
import 'package:feedbackdesign/features/forgot_password/otp_view.dart';
import 'package:feedbackdesign/features/home_screen/home_screen_view.dart';
import 'package:feedbackdesign/features/onboarding/onboarding_views/login_screen.dart';
import 'package:feedbackdesign/features/onboarding/onboarding_views/onboarding_welcome_screen.dart';
import 'package:feedbackdesign/features/onboarding/onboarding_views/signup_screen.dart';
import 'package:feedbackdesign/features/splash/splash_view.dart';
import 'package:feedbackdesign/shared/constants/app_routes.dart';
import 'package:flutter/cupertino.dart';
import '../../features/admin_screens/FormSettingsScreen/form_settings_screen.dart';
import '../../features/admin_screens/QuestionTemplateBuilderScreen/question_template_builder_screen.dart.dart';
import '../../features/admin_screens/admin_dashboard_screen/admin_dashboard_screen.dart';
import '../../features/feebdackTemplets/emoji_likert_feedback_screen/emoji_likert_feedback_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String? routeName = settings.name;

    final Widget widget;
    switch (routeName) {
      case AppRoutes.TEST_SCREEN:
        widget = SplashView();
        break;
      case AppRoutes.SPLASH:
        widget = SplashView();
        break;
      case AppRoutes.ONBOARDING_SCREEN:
        widget = SignupScreen();
        break;
      case AppRoutes.LOGIN_SCREEN:
        widget = OnboardingWelcomeScreen();
        break;
      case AppRoutes.FORGOT_PASSWORD_SCREEN:
        widget = ForgotPasswordView();
        break;
      case AppRoutes.OTP_SCREEN:
        widget = OTPView(email: settings.arguments as String);
        break;
      case AppRoutes.ONBRD_WELCOM_SCREEN:
        widget = OnboardingWelcomeScreen();
        break;
      case AppRoutes.FORMBUILDER_HOME_SCREEN:
      case AppRoutes.DASHBOARD_SCREEN:
        widget = AdminDashboardScreenView();
        break;
      case AppRoutes.QUESTION_TEMPLATE_BUILDER_SCREEN:
        widget = QuestionForm();
        break;
      case AppRoutes.EMOJI_LIKERT_FEEDBACK_SCREEN:
        widget = EmojiLikertFeedbackScreen();
        break;
      case AppRoutes.SETTING_TEMPLATE_SCREEN:
        widget = FormSettingsScreen();
        break;
      case AppRoutes.SIGNUP_SCREEN:
        widget = SignupScreen();
        break;
      default:
        widget = SplashView();
    }

    return CupertinoPageRoute(
      builder: (_) {
        //To show content below NavBar
        return SafeArea(
          left: false,
          right: false,
          top: false,
          bottom: false,
          child: widget,
        );
      },
      settings: RouteSettings(name: routeName),
    );
  }
}
