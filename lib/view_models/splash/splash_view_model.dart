import 'dart:async';
import 'package:safe_chat/views/welcome/welcome_view.dart';
import 'package:stacked/stacked.dart';

import '../../locator/locator.dart';

class SplashScreenViewModel extends BaseViewModel {
  Future<void> initializeSplashScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    navigationService.push(const WelcomeView());
  }
}
