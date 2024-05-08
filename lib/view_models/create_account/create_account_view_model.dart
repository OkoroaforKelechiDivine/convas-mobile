import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:safe_chat/core/data/model/params/create_account/create_account_param.dart';
import 'package:safe_chat/core/di/di.dart';

class CreateAccountViewModel extends BaseViewModel {
  String? selectedGender;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController gender = TextEditingController();
  bool isLoading = false;

  String? firstNameError;
  String? lastNameError;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  void validateAndClearErrors() {
    firstNameError = firstName.text.isEmpty ? 'First Name cannot be empty' : null;
    lastNameError = lastName.text.isEmpty ? 'Last Name cannot be empty' : null;
    emailError = phoneNumber.text.isEmpty ? 'Email cannot be empty' : null;
    passwordError = password.text.isEmpty ? 'Password cannot be empty' : null;
    notifyListeners();
  }

  void updateSelectedGender(String? newValue) {
    selectedGender = newValue;
  }

  Future<void> createAccount(BuildContext context, Function()? onPop) async {
    validateAndClearErrors();
    if (firstNameError != null || lastNameError != null || emailError != null || passwordError != null) {
      return;
    }
    isLoading = true;
    notifyListeners();
    final response = await createAccountRepository.createAccount(
      param: CreateAccountParam(
        firstName: firstName.text,
        lastName: lastName.text,
        password: password.text,
        gender: gender.text,
        phoneNumber: phoneNumber.text,
      ),
    );
    if (response.success) {
      isLoading = false;
      notifyListeners();
      snackbarService.success(message: response.data!.message);
      onPop?.call();
      navigationService.pop();
    } else {
      isLoading = false;
      notifyListeners();
      snackbarService.error(message: response.message!);
    }
  }
}
