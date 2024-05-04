import 'package:flutter/material.dart';

class User {
  final String username;
  final String profile;

  User(this.username, this.profile);
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final List<User> users = [
    User("user1", "Profile 1"),
    User("user2", "Profile 2"),
    User("user3", "Profile 3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(user.username[0]),
            ),
            title: Text(user.username),
            subtitle: Text(user.profile),
            onTap: () {},
          );
        },
      ),
    );
  }
}