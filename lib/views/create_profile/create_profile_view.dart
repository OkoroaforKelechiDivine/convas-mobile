import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safe_chat/locator/locator.dart';
import 'package:safe_chat/views/create_profile/widget/form.dart';
import 'package:safe_chat/views/create_profile/widget/profile_picture.dart';
import 'package:stacked/stacked.dart';
import '../../app_style/manager/theme_manager.dart';
import '../../view_models/create_profile/create_profile_view_model.dart';
import '../feeds/feeds_view.dart';

class CreateProfileView extends StatelessWidget {
  final String selectedGender;

  const CreateProfileView({Key? key, required this.selectedGender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProfileScreenViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: EdgeInsets.only(left: 50.w),
              child: const Text('Create Profile'),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_sharp),
              onPressed: () {
                // Navigator.of(context).pushReplacementNamed('/verify_code');
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.h),
                  ProfilePictureWidget(selectedGender: selectedGender, viewModel: viewModel),
                  SizedBox(height: 20.h),
                  ProfileFormWidget(viewModel: viewModel),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                navigationService.push(const FeedsView());
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blackColor,
              ),
              child: Text('Save profile', style: TextStyle(color: AppColors.white)),
            ),
          ),
        );
      },
    );
  }
}
