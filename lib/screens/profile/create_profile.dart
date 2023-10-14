import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:safe_chat/appConfig/manager/theme_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  String? userName;
  String? firstName;
  String? lastName;
  String? emailAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              _buildProfilePicture(),
              _buildProfileForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePicture() {
    return GestureDetector(
      onTap: _viewImage,
      child: Align(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey,
              backgroundImage: _image != null ? FileImage(_image!) : null,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: _getImage,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.activeButton,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.edit,
                    size: 20,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileForm() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 50),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Username'),
            onChanged: (value) {
              setState(() {
                userName = value;
              });
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(labelText: 'First Name'),
            onChanged: (value) {
              setState(() {
                firstName = value;
              });
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Last Name'),
            onChanged: (value) {
              setState(() {
                lastName = value;
              });
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email Address'),
            onChanged: (value) {
              setState(() {
                emailAddress = value;
              });
            },
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: _saveProfile,
            child: const Text('Complete'),
          ),
        ],
      ),
    );
  }

  void _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _viewImage() {
    if (_image != null) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(_image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }

  void _saveProfile() {
    Navigator.pushNamed(context, "/home_page");
  }
}
