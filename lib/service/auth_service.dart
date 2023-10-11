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
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      showSnackBar(context, "Network problem. Please check your internet connection.");
      return;
    }

    try {
      final response = await dio.post(
        'https://cyber-mind-deploy.onrender.com/api/auths/create',
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    } catch (e) {
      showSnackBar(context, "User with that email already exists");
    }
  }

  static Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      showSnackBar(context, "Network problem. Please check your internet connection.");
      return;
    }

    try {
      final response = await dio.post(
        'https://cyber-mind-deploy.onrender.com/api/auths/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        showSnackBar(context, "Login successful!");
        Navigator.of(context).pushReplacementNamed('/home');
        final Map<String, dynamic> responseData = response.data;
        final String token = responseData['token'];
        context.read<TokenProvider>().setToken(token);
      }
    } catch (e) {
      showSnackBar(context, "Login failed. Please try again.");
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
