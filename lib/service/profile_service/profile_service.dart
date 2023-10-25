import 'dart:convert';
import 'package:http/http.dart' as http;

import '../auth_service/auth_service.dart';

class ProfileApiService {
  static const String baseUrl = 'https://cyber-mind-deploy.onrender.com/api/profile';

  Future<void> createProfile(
      String username,
      DateTime dateOfBirth,
      String bio,
      String hobbies,
      String imagePath,
      ) async {
    // final userId = AuthApiService.userId;
    // if (userId == null) {
    //   return;
    // }
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/create'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'dateOfBirth': dateOfBirth.toIso8601String(),
          'bio': bio,
          'hobbies': hobbies,
          'profileImageUrl': imagePath,
        }),
      );

      if (response.statusCode == 200) {
        print('Profile created successfully');
        // You can handle the success response here
      } else {
        print('Failed to create profile: ${response.statusCode}');
        print('Response Body: ${response.body}');
        // Handle the error response
      }
    } catch (e) {
      print('Error creating profile: $e');
      // Handle any network or request errors here
    }
  }
}
