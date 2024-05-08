import 'package:flutter/material.dart';
import 'package:safe_chat/views/create_account/create_account.dart';
import 'package:stacked/stacked.dart';
import '../../core/di/locator.dart';

class WelcomeViewModel extends BaseViewModel{
  void navigateToCreateAccount(BuildContext context) {
    navigationService.pushReplacement(const CreateAccountView());
  }
}
