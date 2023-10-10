import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_chat/service/token/TokenProvider.dart';

class AuthApiService {
  static final Dio dio = Dio();

  static Future<void> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final response = await dio.post(
        'https://cyber-mind-deploy.onrender.com/api/users/create',
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        Navigator.of(context).pushReplacementNamed('/login');
      } else if (response.statusCode == 409) {
        showSnackBar(context, "User already exists");
      } else {
        showSnackBar(context, "Error creating a new account");
      }
    } catch (e) {
      showSnackBar(context, "Error trying to create user account, please check your network");
    }
  }

  static Future<void> login({
    required BuildContext context,
    required String email,
    required String password
  }) async {
    final dio = Dio();
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      showSnackBar(context, "Network problem. Please check your internet connection.");
      return;
    }

    try {
      Response response = await dio.post(
        "https://cyber-mind-deploy.onrender.com/api/users/login",
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        Navigator.of(context).pushReplacementNamed('/home');
        final Map<String, dynamic> responseData = response.data;
        final String token = responseData['token'];
        context.read<TokenProvider>().setToken(token);
        return;
      }
    } catch (exception) {
      showSnackBar(context, "Login Failed, please try again.");
    }
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
