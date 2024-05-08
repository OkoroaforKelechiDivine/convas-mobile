import 'package:flutter/material.dart';
import '../../views/home_page/set_home_page.dart';

class AppGlobals extends ChangeNotifier {
  static AppGlobals instance = AppGlobals._();
  AppGlobals._();

  String? _token;
  String? _notificationToken;
  User? _user;
  // List<BeneficiaryDetailResponse>? _beneficiaries;
  // List<BankResponse>? _banks;

  Future<void> init() async {
    // _token = authLocalStorage.getToken();
    // _user = appLocalStorage.getUser();
    // _banks = appLocalStorage.getBanks();
    // _beneficiaries = appLocalStorage.getBeneficiaries();
    // _notificationToken = appLocalStorage.getNotificationToken();
  }

  set token(String? value) {
    _token = value;
    notifyListeners();
  }

  // set beneficiaries(List<BeneficiaryDetailResponse>? value) {
  //   _beneficiaries = value;
  //   notifyListeners();
  // }

  set user(User? value) {
    _user = value;
    notifyListeners();
  }

  // set banks(List<BankResponse>? value) {
  //   _banks = value;
  //   notifyListeners();
  // }

  set notificationToken(String? value) {
    _notificationToken = value;
    notifyListeners();
  }

  String? get token => _token;
  User? get user => _user;
  // List<BankResponse>? get banks => _banks;
  // List<BeneficiaryDetailResponse>? get beneficiaries => _beneficiaries;
  String? get notificationToken => _notificationToken;
}
