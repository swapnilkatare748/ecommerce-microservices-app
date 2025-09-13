import 'package:feedbackdesign/shared/constants/app_constants.dart';

class APIs {
  APIs._();

  static String get BASE_URL {
    const String env = AppConstants.APP_ENV;
    switch (env) {
      case 'DEV':
        return 'https://www.dev.example.com';
      case 'QA':
        return 'https://www.dev.example.com';
      case 'PROD':
        return 'https://www.dev.example.com';
      default:
        return 'https://www.dev.example.com';
        ; // Default to DEV URL
    }
  }

  static const String _V1 = '/v1';

  static const String TEST_API = '$_V1/test-api';
  static const String LOGIN = '/api/user/Login/Login';
  static String FORGET_PASSWORD(String email) {
    return '/api/user/User/ForgotPassword/$email';
  }

  static const String REGISTRATION = '/api/user/Login/Registration';
}
