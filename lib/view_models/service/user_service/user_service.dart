import 'package:dio/dio.dart';

import '../../user_model.dart';

class UserService {
  final Dio _dio;
  final String token;

  UserService(this.token) : _dio = Dio();

  Future<List<AppUser>> getAllUsers() async {
    try {
      final response = await _dio.get(
        'https://cyber-mind-deploy.onrender.com/api/users/all',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = List.from(response.data);
        final users = jsonList.map((json) => AppUser.fromJson(json)).toList();
        return users;
      } else {
        throw Exception('Failed to load users. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }
}
