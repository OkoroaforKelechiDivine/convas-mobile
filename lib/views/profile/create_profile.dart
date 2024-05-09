import 'package:flutter/material.dart';
import 'package:safe_chat/views/profile/widget/form.dart';
import 'package:safe_chat/views/profile/widget/profile_picture.dart';
import '../../app_style/manager/theme_manager.dart';
import '../../view_models/create_profile/create_profile_view_model.dart';

class ProfileScreen extends StatefulWidget {
  final String selectedGender;

  const ProfileScreen({Key? key, required this.selectedGender}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileScreenViewModel _viewModel = ProfileScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text('Create Profile'),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/verify_code');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              ProfilePictureWidget(selectedGender: widget.selectedGender, viewModel: _viewModel),
              const SizedBox(height: 20),
              ProfileFormWidget(viewModel: _viewModel),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/home_page');
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blackColor
          ),
          child: Text('Save profile', style: TextStyle(color: AppColors.white)),
        ),
      ),
    );
  }
}