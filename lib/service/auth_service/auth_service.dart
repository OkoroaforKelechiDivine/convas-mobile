import 'dart:js';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:provider/provider.dart';

import '../token/TokenProvider.dart';

class AuthApiService {
  static final Dio dio = Dio();
  static const String baseUrl = 'https://cyber-mind-deploy.onrender.com/api';

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
          'message': 'Network problem. Please check your internet connection.',
        };
      }

      final capitalizedGender = gender.toUpperCase();

      final response = await dio.post(
        '$baseUrl/auths/create',
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'gender': capitalizedGender,
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        final userId = response.data['id'];
        context.read<TokenProvider>().setUserId(userId);
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pushReplacementNamed('/create_profile');
        });
        return {'success': true};
      } else if (response.statusCode == 409) {
        return {'success': false, 'message': 'User with that email already exists'};
      } else {
        return {'success': false, 'message': 'An error occurred. Please try again later.'};
      }
    } catch (e) {
      return {'success': false, 'message': 'An error occurred. Please try again later.'};
    }
  }

  static Future<Map<String, dynamic>> createProfile(
      String username,
      String bio,
      String hobbies,
      String dateOfBirth,
      String profileImageUrl,
      BuildContext context,
      ) async {
    final userId = context.read<TokenProvider>().getUserId();
    try {
      final response = await dio.post(
        '$baseUrl/profile/create/$userId',
        data: {
          'username': username,
          'bio': bio,
          'hobbies': hobbies,
          'dateOfBirth': dateOfBirth,
          'profileImageUrl': profileImageUrl
        },
      );

      if (response.statusCode == 200) {
        return {'success': true};
      } else {
        return {'success': false, 'message': 'Error creating user profile.'};
      }
    } catch (e) {
      return {'success': false, 'message': 'An error occurred. Please try again later.'};
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
        '$baseUrl/auths/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final String token = responseData['data']['token'];
        print("this is the token" + token);
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pushReplacementNamed('/get_all_users');
        });
        context.read<TokenProvider>().setToken(token);
      }
    } catch (e) {
      showSnackBar(context, "Incorrect Email and Password.");
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
