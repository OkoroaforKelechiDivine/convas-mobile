import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:safe_chat/appConfig/manager/theme_manager.dart';

class ProfileScreen extends StatefulWidget {

  final String selectedGender;

  const ProfileScreen({Key? key, required this.selectedGender}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  String? userName;
  String? firstName;
  String? lastName;
  DateTime? dateOfBirth;
  String? emailAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed("/sign_up");
          },
        ),
      ),
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
    final isMale = widget.selectedGender == 'Male';
    return GestureDetector(
      onTap: _viewImage,
      child: Align(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.grey,
              backgroundImage: _image != null ? FileImage(_image!)
                  : isMale ? const AssetImage('assets/jpg/male-default-avatar.jpg')
                  : const AssetImage('assets/jpg/female-default-avatar.jpg') as ImageProvider,
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
    final greenUnderline = UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.green),
    );
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
              enabledBorder: greenUnderline,
              focusedBorder: greenUnderline,
            ),
            onChanged: (value) {
              setState(() {
                userName = value;
              });
            },
          ),
          GestureDetector(
            onTap: () => _selectDate(context),
            child: AbsorbPointer(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Date of Birth', // Change the label
                  enabledBorder: greenUnderline,
                  focusedBorder: greenUnderline,
                ),
                controller: TextEditingController(
                    text: dateOfBirth != null
                        ? "${dateOfBirth!.day}/${dateOfBirth!.month}/${dateOfBirth!.year}"
                        : ""), // Display selected date
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Bio',
              enabledBorder: greenUnderline,
              focusedBorder: greenUnderline,
            ),
            onChanged: (value) {
              setState(() {
                lastName = value;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Hobbies',
              enabledBorder: greenUnderline,
              focusedBorder: greenUnderline,
            ),
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: dateOfBirth ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      setState(() {
        dateOfBirth = selectedDate;
      });
    }
  }

  void _saveProfile() {
    Navigator.pushNamed(context, "/home_page");
  }
}
