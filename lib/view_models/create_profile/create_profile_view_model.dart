import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreenViewModel extends ChangeNotifier {
  File? _image;
  String? userName;
  String? firstName;
  String? lastName;
  DateTime? dateOfBirth;
  String? emailAddress;

  File? get image => _image;

  void setImage(File? image) {
    _image = image;
    notifyListeners();
  }

  void setUsername(String value) {
    userName = value;
    notifyListeners();
  }

  void setLastName(String value) {
    lastName = value;
    notifyListeners();
  }

  void setEmailAddress(String value) {
    emailAddress = value;
    notifyListeners();
  }

  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
    } else {
      print('No image selected.');
    }
  }

  Future<void> viewImage(BuildContext context) async {
    if (_image != null) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Padding(
                  padding: EdgeInsets.only(left: 50),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_sharp),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(_image!),
                      fit: BoxFit.contain,
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

  Future<void> selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: dateOfBirth ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      dateOfBirth = selectedDate;
      notifyListeners();
    }
  }

  void saveProfile(BuildContext context) {
    Navigator.pushNamed(context, "/home_page");
  }
}