import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:safe_chat/check_mail/set_check_mail.dart';
import 'package:safe_chat/screens/auth/auth.dart';
import 'package:safe_chat/screens/forgot_password/set_forgot_password.dart';
import 'package:safe_chat/screens/home_page/set_home_page.dart';
import 'package:safe_chat/screens/info/info2_screen.dart';
import 'package:safe_chat/screens/info/info1_screen.dart';
import 'package:safe_chat/screens/login/set_login.dart';
import 'package:safe_chat/screens/profile/create_profile.dart';
import 'package:safe_chat/screens/reset_password/set_reset_password.dart';
import 'package:safe_chat/screens/signup/sign_up.dart';
import 'package:safe_chat/screens/splash/splash_screen.dart';
import 'package:safe_chat/screens/verify_code/set_verify_code.dart';
import 'package:safe_chat/user_list/set_get_all_users.dart';

import 'appConfig/manager/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(microseconds: 40),
      debugShowCheckedModeBanner: false,
      title: 'SafeChat',
      theme: getApplicationTheme(),
      home: const SplashScreen(),
      routes: {
        "/home": (context) => const AuthScreen(),
        "/info1": (context) => const InfoOneScreen(),
        "/info2": (context) => const InfoTwoScreen(),
        "/login": (context) => const LoginScreen(),
        "/sign_up": (context) => const SignUpScreen(),
        "/forget-password": (context) => const ForgotPasswordScreen(),
        "/check-mail": (context) => const CheckMailScreen(),
        "/verify_code": (context) => const VerifyCodeScreen(),
        "/reset-password": (context) => const ResetPasscodeScreen(),
        "/create_profile": (context) => const ProfileScreen(selectedGender: ''),
        "/home_page": (context) => const HomePageScreen(),
        "/get_all_users": (context) => const GetAllUsersScreen(),
      },
    );
  }
}