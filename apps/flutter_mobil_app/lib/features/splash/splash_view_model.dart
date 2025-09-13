import 'package:feedbackdesign/shared/constants/app_routes.dart';
import 'package:feedbackdesign/shared/constants/pref_keys.dart';
import 'package:feedbackdesign/shared/routes/route_helper.dart';
import 'package:feedbackdesign/shared/utils/pref_helper.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  Future init() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    await openScreenByUserStatus();
  }

  Future openScreenByUserStatus() async {
    RouteHelper.push(AppRoutes.ONBRD_WELCOM_SCREEN);
  }
}
