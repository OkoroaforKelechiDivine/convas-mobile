import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:safe_chat/views/splash/splash_view.dart';

import 'app_style/manager/theme_manager.dart';
import 'locator/locator.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
        child: ScreenUtilInit(
          builder: (context, child) {
            return GestureDetector(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                navigatorKey: navigationService.navigatorKey,
                title: 'SafeChat',
                theme: getApplicationTheme(),
                home: const SplashView(),
              ),
            );
          },
        ),
    );
  }
}
