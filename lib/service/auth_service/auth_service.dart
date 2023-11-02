import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../controllers/constant/api_constants.dart';

class AuthApiService {
  Future<Map<String, dynamic>> registerUser({
    required String firstName,
    required String lastName,
    required String password,
    required String email,
    required BuildContext context,
  }) async {
    final registerEndpoint = ApiConstants.registerUserEndpoint();

    final registrationData = {
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'email': email,
    };

    final response = await http.post(
      Uri.parse(registerEndpoint),
      body: jsonEncode(registrationData),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 201) {
      Navigator.pushNamed(context, '/create_profile');
      final responseData = json.decode(response.body);
      return {'data': responseData, 'error': null};
    } else if (response.statusCode == 409) {
      return {'data': null, 'error': "User with this email already exists"};
    } else {
      return {'data': null, 'error': "User creation failed"};
    }
  }
}
