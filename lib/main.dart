import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safe_chat/view_models/service/navigations/navigation_service.dart';

import 'app.dart';
import 'core/di/app_globals.dart';
import 'core/di/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      //statusBarColor: AppColors.sdp25, // status bar color
      // Status bar brightness (optional)
      // statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      // statusBarBrightness: Brightness.light,
    ),
  );
  setupLocator();
  // await LocalStorageService.init();
  await AppGlobals.instance.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // EnvironmentInitializer.setEnvironment(Environment.DEV);

  // final notificationService = NotificationService();
  //final messaging = Messaging();
  // notificationService.requestPermission();
  // Messaging.registerNotification();
  // Messaging.setupInteractedMessage();
  // Messaging.checkForInitialMessage();
  // notificationService.getToken();

  runApp(
    const MyApp(),
  );
}
