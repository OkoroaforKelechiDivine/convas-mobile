import 'package:flutter/material.dart';
import '../../view_models/user_model.dart';
import '../chat/set_chat.dart';

class ProfileDetailsScreen extends StatefulWidget {
  final AppUser user;

  const ProfileDetailsScreen({required this.user, Key? key}) : super(key: key);

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(widget.user.profileImageUrl ?? ''),
              ),
              Text('First Name: ${widget.user.firstName ?? 'Unknown'}'),
              Text('Email: ${widget.user.email ?? 'No Email'}'),
              SizedBox(height: 20),
              isFollowing
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle unfollowing here
                      setState(() {
                        isFollowing = false;
                      });
                    },
                    style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all(Colors.red),
                    ),
                    child: Text('Unfollow'),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      // Navigate to the messaging screen
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MessagingScreen(user: widget.user),
                        ),
                      );
                    },
                    icon: Icon(Icons.message),
                  ),
                ],
              )
                  : TextButton(
                onPressed: () {
                  // Handle following here
                  setState(() {
                    isFollowing = true;
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.blue),
                ),
                child: Text('Follow'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
