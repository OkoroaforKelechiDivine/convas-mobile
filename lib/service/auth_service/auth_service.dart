import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';

import '../../controllers/constant/api_constants.dart';


class AuthApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> registerUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String gender,

  }) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw Exception('No internet connection');
    }

    try {
      final response = await _dio.post(
        ApiConstants.registerUserEndpoint(),
        data: {
          'email': email,
          'password': password,
          'firstName' : firstName,
          'lastName' : lastName,
          'gender' : gender
        },
      );

      if (response.statusCode == 201) {
        return response.data;
      } else if (response.statusCode == 409) {
        throw Exception('User with this email already exists');
      } else {
        throw Exception('User creation failed');
      }
    } catch (error) {
      throw Exception('Failed to register user: $error');
    }
  }
}
