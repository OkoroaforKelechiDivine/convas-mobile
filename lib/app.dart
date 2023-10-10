import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:safe_chat/screens/home/home.dart';
import 'package:safe_chat/screens/info/info1_screen.dart';
import 'package:safe_chat/screens/info/info2_screen.dart';
import 'package:safe_chat/screens/login/set_login.dart';
import 'package:safe_chat/screens/signup/sign_up.dart';
import 'package:safe_chat/screens/splash/splash_screen.dart';

import 'appConfig/manager/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(microseconds: 40),
      debugShowCheckedModeBanner: false,
      title: 'Safe Chat',
      theme: getApplicationTheme(),
      home: const SplashScreen(),
      routes: {
        "/home": (context) => const HomeScreen(),
        "/info1": (context) => const InfoOneScreen(),
        "/info2": (context) => const InfoTwoScreen(),
        "/login": (context) => const LoginScreen(),
        "/sign_up": (context) => const SignUpScreen(),
      },
    );
  }
}