import 'package:flutter/cupertino.dart';

class TokenProvider with ChangeNotifier {
  String _token = "";
  String _userId = "";

  String get token => _token;
  String get userId => _userId;

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  void setUserId(String userId) {
    _userId = userId;
    notifyListeners();
  }
}
