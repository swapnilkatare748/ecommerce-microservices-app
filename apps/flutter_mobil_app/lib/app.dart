import 'package:feedbackdesign/features/splash/splash_view.dart';
import 'package:feedbackdesign/shared/constants/app_constants.dart';
import 'package:feedbackdesign/shared/globals.dart';
import 'package:feedbackdesign/shared/routes/route_generator.dart';
import 'package:feedbackdesign/shared/routes/route_helper.dart';
import 'package:feedbackdesign/shared/utils/app_client.dart';
import 'package:feedbackdesign/shared/utils/device_utils.dart';
import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'shared/app_controller.dart';

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    RouteHelper.init(Globals.routeNavigatorKey);

    _setSystemUIMode();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = AppColors.background;
    return MaterialApp(
      title: "Feedback",
      themeMode: ThemeMode.light,
      theme: RKTheme.appThemeLight,
      navigatorKey: Globals.routeNavigatorKey,
      onGenerateRoute: RouteGenerator.generateRoute,

      builder: (BuildContext context, Widget? child) {
        DeviceUtils(context);

        return ColoredBox(
          color:
              DeviceUtils.isPhone || AppClient.isMobile
                  ? Colors.transparent
                  : backgroundColor,
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: DeviceUtils.size.width),
              child: MediaQuery.withClampedTextScaling(
                maxScaleFactor: 1.15,
                child: AnnotatedRegion(
                  value: SystemUiOverlayStyle.light.copyWith(
                    statusBarColor: Colors.transparent,
                    systemNavigationBarColor: Colors.transparent,
                  ),
                  child: Banner(
                    message: AppConstants.APP_ENV,
                    color: AppColors.brandPrimary,
                    location: BannerLocation.topStart,
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      home: SplashView(),
    );
  }

  void _setSystemUIMode() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top],
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // IMPROVE: move to kit
    if (state == AppLifecycleState.paused) {
      Globals.lastActiveSessionDateTime ??= DateTime.now();
      Globals.lastBiometricAuthorizedDateTime ??= DateTime.now();
    } else if (state == AppLifecycleState.resumed) {
      AppController.instance.validateOnResume();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
