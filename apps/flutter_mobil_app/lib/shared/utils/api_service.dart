import 'package:feedbackdesign/api/api_client.dart';
import 'package:feedbackdesign/api/models/base_response.dart';
import 'package:feedbackdesign/features/onboarding/onboarding_views/models/login_response.dart';
import 'package:feedbackdesign/shared/constants/api_constants.dart';
import 'package:feedbackdesign/shared/utils/json_map.dart';

class ApiService {
  final ApiClient _apiClient = ApiClient();

  /// Login
  Future<LoginResponse> login(String email, String password) async {
    const String url = APIs.LOGIN;
    final JsonMap body = {"email": email, "password": password};

    final BaseResponse baseResponse = await _apiClient.post(url, body: body);
    return LoginResponse.fromJson(baseResponse.data!);
  }

  /// Register
  Future<BaseResponse> register(JsonMap body) async {
    const String url = APIs.REGISTRATION;
    final BaseResponse baseResponse = await _apiClient.post(url, body: body);
    return baseResponse;
  }

  /// Forget Password
  Future<BaseResponse> forgetPassword(String email) async {
    String url = APIs.FORGET_PASSWORD(email);
    final BaseResponse baseResponse = await _apiClient.get(url);
    return baseResponse;
  }
}
