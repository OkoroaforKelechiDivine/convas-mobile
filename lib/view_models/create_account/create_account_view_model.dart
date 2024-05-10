import 'package:flutter/material.dart';
import 'package:safe_chat/views/verify_code/verify_code_view.dart';
import 'package:safe_chat/views/welcome/welcome_view.dart';
import 'package:stacked/stacked.dart';

import '../../locator/locator.dart';
import '../../model/params/create_account/create_account_param.dart';

class CreateAccountViewModel extends BaseViewModel {
  String? selectedGender;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController gender = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? firstNameError;
  String? lastNameError;
  String? phoneNumberError;
  String? passwordError;
  String? genderError;
  String? confirmPasswordError;

  void navigateToWelcomeScreen(BuildContext context) {
    navigationService.pushReplacement(const WelcomeView());
  }

  static void navigateToVerifyCodeScreen() {
    navigationService.push(const VerifyCodeView());
  }

  void validateAndClearErrors() {
    firstNameError = firstName.text.isEmpty ? 'First Name cannot be empty' : null;
    lastNameError = lastName.text.isEmpty ? 'Last Name cannot be empty' : null;
    phoneNumberError = phoneNumber.text.isEmpty ? 'Phone number cannot be empty' : null;
    passwordError = password.text.isEmpty ? 'Password cannot be empty' : null;
    confirmPasswordError = confirmPassword.text.isEmpty ? 'Confirm Password cannot be empty' : null;
    confirmPasswordError = password.text != confirmPassword.text ? 'Passwords do not match' : confirmPasswordError;
    genderError = gender.text.isEmpty ? 'Please select a gender' : null;

    notifyListeners();
  }

  void updateSelectedGender(String? newValue) {
    clearGenderError();
    selectedGender = newValue;
    notifyListeners();
  }

  void clearFirstNameError() {
    firstNameError = null;
    notifyListeners();
  }

  void clearLastNameError() {
    lastNameError = null;
    notifyListeners();
  }

  void clearPhoneNumberError() {
    phoneNumberError = null;
    notifyListeners();
  }

  void clearPasswordError() {
    passwordError = null;
    notifyListeners();
  }

  void clearConfirmPasswordError() {
    confirmPasswordError = null;
    notifyListeners();
  }

  String? clearGenderError() {
    genderError = null;
    notifyListeners();
    return genderError;
  }


  Future<void> createAccount( Function()? onPop) async {
    _isLoading = true;
    notifyListeners();
    validateAndClearErrors();

    if (firstNameError != null || lastNameError != null || phoneNumberError != null || passwordError != null || confirmPasswordError != null || genderError != null) {
      _isLoading = false;
      notifyListeners();
      return;
    }

    String modifiedPhoneNumber = phoneNumber.text.replaceFirst('0', '+234');
    String modifiedGender = gender.text.toUpperCase();

    final response = await createAccountRepository.createAccount(
      param: CreateAccountParam(
          firstName: firstName.text,
          lastName: lastName.text,
          password: password.text,
          gender: modifiedGender,
          phoneNumber: modifiedPhoneNumber
      ),
    );
    if (response.success) {
      snackbarService.success(message: response.data!.message);
      onPop?.call();
    } else {
      print("I am sorry but it is a sad news sha");
      snackbarService.error(message: response.message!);
    }
    _isLoading = false;
    notifyListeners();
  }
}
