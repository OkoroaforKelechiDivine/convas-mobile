import 'package:dio/dio.dart';

class ApiService {
  static final Dio dio = Dio();

  static Future<bool> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
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
        print("Successfully created a new account");
        return true;
      } else {
        print("Error creating a new account from  the server");
        return false;
      }
    } catch (e) {
      // Handle Dio request error
      return false;
    }
  }
}
