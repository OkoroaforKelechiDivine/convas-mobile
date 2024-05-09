import 'package:flutter/material.dart';
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
  bool isLoading = false;

  String? firstNameError;
  String? lastNameError;
  String? phoneNumberError;
  String? passwordError;
  String? genderError;
  String? confirmPasswordError;

  void navigateToWelcomeScreen(BuildContext context) {
    navigationService.pushReplacement(const WelcomeView());
  }

  void validateAndClearErrors() {
    if (firstName.text.isEmpty) {
      firstNameError = 'First Name cannot be empty';
    } else {
      firstNameError = null;
    }
    if (lastName.text.isEmpty) {
      lastNameError = 'Last Name cannot be empty';
    } else {
      lastNameError = null;
    }
    if (phoneNumber.text.isEmpty) {
      phoneNumberError = 'Phone number cannot be empty';
    } else {
      phoneNumberError = null;
    }
    if (password.text.isEmpty) {
      passwordError = 'Password cannot be empty';
    } else {
      passwordError = null;
    }
    if (confirmPassword.text.isEmpty) {
      confirmPasswordError = 'Confirm Password cannot be empty';
    } else {
      confirmPasswordError = null;
    }
    if (password.text != confirmPassword.text) {
      confirmPasswordError = 'Passwords do not match';
    }
    if (gender.text.isEmpty) {
      genderError = 'Please select a gender';
    } else {
      genderError = null;
    }
    notifyListeners();
  }

  void updateSelectedGender(String? newValue) {
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

  void clearGenderError() {
    genderError = null;
    notifyListeners();
  }

 Future<void> createAccount( Function()? onPop) async {
    validateAndClearErrors();

    if (firstName.text.isEmpty) {
      firstNameError = 'First Name cannot be empty';
    }
    if (lastName.text.isEmpty) {
      lastNameError = 'Last Name cannot be empty';
    }
    if (phoneNumber.text.isEmpty) {
      phoneNumberError = 'Phone number cannot be empty';
    }
    if (password.text.isEmpty) {
      passwordError = 'Password cannot be empty';
    }
    if (confirmPassword.text.isEmpty) {
      confirmPasswordError = 'Confirm Password cannot be empty';
    }
    if (gender.text.isEmpty) {
      genderError = 'Please select a gender';
    }
    notifyListeners();

    if (firstNameError != null || lastNameError != null || phoneNumberError != null || passwordError != null || confirmPasswordError != null || genderError != null) {
      return;
    }
    isLoading = false;
    notifyListeners();

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
      navigationService.pop();
    } else {
      snackbarService.error(message: response.message!);
    }
  }
}
