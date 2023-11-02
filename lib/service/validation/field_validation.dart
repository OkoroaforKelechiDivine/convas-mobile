class FieldValidation {
  static bool isFieldEmpty(String value) {
    return value.isEmpty;
  }

  static bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  static bool isPasswordStrong(String password) {
    final lengthRequirement = password.length >= 8;
    final hasLetter = password.contains(RegExp(r'[a-zA-Z]'));
    final hasDigit = password.contains(RegExp(r'[0-9]'));
    final hasSpecialChar = password.contains(RegExp(r'[!@#\$%^&*()_+[\]{};:<>|./?,-]'));
    return lengthRequirement && hasLetter && hasDigit && hasSpecialChar;
  }
}
