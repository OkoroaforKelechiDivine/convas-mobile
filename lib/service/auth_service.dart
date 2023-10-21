import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_chat/appConfig/manager/theme_manager.dart';
import 'package:safe_chat/service/token/TokenProvider.dart';

class AuthApiService {
  static final Dio dio = Dio();
  static const String baseUrl = 'https://cyber-mind-deploy.onrender.com/api/auths';

  static Future<void> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String gender,
    required String password,
    required BuildContext context,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      showSnackBar(context, "Network problem. Please check your internet connection.");
      return;
    }

    final capitalizedGender = gender.toUpperCase();

    try {
      final response = await dio.post(
        '$baseUrl/create',
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'gender': capitalizedGender,
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        Navigator.of(context).pushReplacementNamed('/profile');
      } else if (response.statusCode == 409) {
        showSnackBar(context, "User with that email already exists");
      }
    } catch (e) {
      showSnackBar(context, "An error occurred. Please try again later.");
    }
  }

  static Future<void> loginUser({
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
        '$baseUrl/login',
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
      } else if (response.statusCode == 403) {
        showSnackBar(context, "Incorrect Email and Password. Please try again.");
      }
    } catch (e) {
      showSnackBar(context, "Incorrect Email and Password.");
    }
  }

  static Future<void> forgotPassword({
    required String email,
    required BuildContext context,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      showSnackBar(context, "Network problem. Please check your internet connection.");
      return;
    }

    try {
      final response = await dio.post(
        '$baseUrl/forgot-password',
        data: {
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        Navigator.of(context).pushReplacementNamed('/check-mail');
        showSnackBar(context, "Password reset email sent successfully.");
      }
    } catch (e) {
      showSnackBar(context, "Password reset request failed. Please try again.");
    }
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.activeButton,
        content: Center(child: Text(message)),
      ),
    );
  }
}
