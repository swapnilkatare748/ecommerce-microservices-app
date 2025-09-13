import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:feedbackdesign/app.dart';
import 'package:feedbackdesign/shared/app_controller.dart';

import 'features/admin_screens/widget/form_flow_view_model.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppController.instance.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FormFlowViewModel()),
        // Add more providers if needed
      ],
      child: const App(),
    ),
  );
}
