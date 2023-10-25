import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class AuthApiService {
  static final Dio dio = Dio();
  static const String baseUrl = 'https://cyber-mind-deploy.onrender.com/api/auths';
  static String? userId;

  static Future<Map<String, dynamic>> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String gender,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return {
          'success': false,
          'message': "Network problem. Please check your internet connection.",
        };
      }

      final capitalizedGender = gender.toUpperCase();

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
        final Map<String, dynamic> responseData = response.data;
        Navigator.of(context).pushReplacementNamed('/create_profile');
        return {'success': true};
      } else if (response.statusCode == 409) {
        return {'success': false, 'message': "User with that email already exists"};
      } else {
        return {'success': false, 'message': "An error occurred. Please try again later."};
      }
    } catch (e) {
      return {'success': false, 'message': "An error occurred. Please try again later."};
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
