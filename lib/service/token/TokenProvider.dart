import 'package:flutter/cupertino.dart';

class TokenProvider with ChangeNotifier {
  String _token = "";

  String get token => _token;

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }
}