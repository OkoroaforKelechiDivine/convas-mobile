import 'package:dio/dio.dart';
import 'package:safe_chat/service/token/TokenProvider.dart';

import '../../model/user_model.dart';

class UserService {
  final Dio _dio;
  final TokenProvider tokenProvider;

  UserService(this.tokenProvider) : _dio = Dio();

  Future<List<AppUser>> getAllUsers() async {
    final String token = tokenProvider.getToken();
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

  Future<void> followUser(String friendId, String userId) async {
    final String token = tokenProvider.getToken();
    try {
      final response = await _dio.post(
        'https://cyber-mind-deploy.onrender.com/api/users/follow',
        data: {
          'userId': userId,
          'friendId': friendId,
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        print('User is now following the friend.');
      } else if (response.statusCode == 404) {
        print('User or friend not found.');
      } else {
        throw Exception('Failed to follow user. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to follow user: $e');
    }
  }

  Future<void> sendMessage({
    required String senderId,
    required String receiverId,
    required String content,
  }) async {
    final String token = tokenProvider.getToken();
    try {
      final response = await _dio.post(
        'https://cyber-mind-deploy.onrender.com/api/chats/send-message',
        data: {
          'senderId': senderId,
          'receiverId': receiverId,
          'content': content,
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      print("The chat message token is" + token);

      if (response.statusCode == 200) {
        print('Message sent successfully.');
      } else if (response.statusCode == 404) {
        print('Sender or receiver not found.');
      } else if (response.statusCode == 409) {
        print('Receiver and sender are the same.');
      } else if (response.statusCode == 208) {
        print('Malicious content detected. User has been deleted.');
      } else {
        throw Exception('Failed to send message. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }


}
