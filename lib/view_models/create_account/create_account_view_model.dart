import 'package:stacked/stacked.dart';

class CreateAccountViewModel extends BaseViewModel {
  String? selectedGender;

  void updateSelectedGender(String? newValue) {
    selectedGender = newValue;
  }
}
