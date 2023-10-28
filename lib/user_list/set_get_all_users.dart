import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/user_model.dart';
import '../screens/chat/set_chat.dart';
import '../screens/profile/profile_details.dart';
import '../service/token/TokenProvider.dart';
import '../service/user_service/user_service.dart';

class GetAllUsersScreen extends StatefulWidget {
  const GetAllUsersScreen({Key? key}) : super(key: key);

  @override
  _GetAllUsersScreenState createState() => _GetAllUsersScreenState();
}

class _GetAllUsersScreenState extends State<GetAllUsersScreen> {
  List<AppUser> userList = [];
  File? _image;
  final userService = UserService();

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      final users = await userService.getAllUsers();
      setState(() {
        userList = users;
      });
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  // void _navigateToUserProfile(AppUser user) {
    // Navigator.of(context).push(
      // MaterialPageRoute(
      //   builder: (context) {
      //     final tokenProvider = Provider.of<TokenProvider>(context, listen: false);
      //     return ProfileDetailsScreen(user: user, tokenProvider: tokenProvider);
      //   },
      // ),
    // );
  // }

  void _navigateToChatMessage(AppUser user) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MessagingScreen(user: user);
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final tokenProvider = Provider.of<TokenProvider>(context, listen: false);
    print("Token in GetAllUsersScreen: ${tokenProvider.token}");
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
      ),
      body: userList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return ListTile(
            title: Text(user.firstName ?? 'Unknown'),
            subtitle: Text(user.email ?? 'No Email'),
            onTap: () {
              _navigateToChatMessage(user);
            },
            leading: GestureDetector(
              onTap: () {
                _navigateToChatMessage(user);
              },
              child: CircleAvatar(
                radius: 30,
                backgroundImage: _image != null ? FileImage(_image!) : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
