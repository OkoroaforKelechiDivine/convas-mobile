import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:safe_chat/theme_settings/manager/theme_manager.dart';
import 'package:safe_chat/views/auth/auth.dart';
import 'package:safe_chat/views/check_mail/set_check_mail.dart';
import 'package:safe_chat/views/create_account/create_account.dart';
import 'package:safe_chat/views/forgot_password/set_forgot_password.dart';
import 'package:safe_chat/views/home_page/set_home_page.dart';
import 'package:safe_chat/views/login/set_login.dart';
import 'package:safe_chat/views/profile/create_profile.dart';
import 'package:safe_chat/views/reset_password/set_reset_password.dart';
import 'package:safe_chat/views/splash/splash_view.dart';
import 'package:safe_chat/views/user_list/set_get_all_users.dart';
import 'package:safe_chat/views/verify_code/verify_code_view.dart';
import 'package:safe_chat/views/welcome/welcome_view.dart';

import 'core/di/locator.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       child: GetMaterialApp(
//         navigatorKey: navigationService.navigatorKey,
//         defaultTransition: Transition.fadeIn,
//         transitionDuration: const Duration(microseconds: 40),
//         debugShowCheckedModeBanner: false,
//         title: 'SafeChat',
//         theme: getApplicationTheme(),
//         initialRoute: "/",
//         routes: {
//           "/": (context) => const SplashView(),
//           "/home": (context) => const AuthScreen(),
//           "/create_account": (context) => const CreateAccountView(),
//           "/welcome": (context) => const WelcomeView(),
//           "/login": (context) => const LoginScreen(),
//           "/forget-password": (context) => const ForgotPasswordScreen(),
//           "/check-mail": (context) => const CheckMailScreen(),
//           "/verify_code": (context) => const VerifyCodeView(),
//           "/reset-password": (context) => const ResetPasscodeScreen(),
//           "/create_profile": (context) => const ProfileScreen(selectedGender: ''),
//           "/home_page": (context) => const HomePageScreen(),
//           "/get_all_users": (context) => const GetAllUsersScreen(),
//         },
//       ),
//     );
//   }
// }



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
    return
      ScreenUtilInit(
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
    );
  }
}
