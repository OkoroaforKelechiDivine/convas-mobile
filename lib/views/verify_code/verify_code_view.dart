import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safe_chat/locator/locator.dart';
import 'package:safe_chat/views/create_account/create_account.dart';
import 'package:safe_chat/views/create_profile/create_profile_view.dart';
import 'package:stacked/stacked.dart';
import '../../app_style/manager/font_manager.dart';
import '../../app_style/manager/theme_manager.dart';
import '../../view_models/verifyCode/verify_code_view_model.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => VerifyCodeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: EdgeInsets.only(left: 50.w),
              child: const Text('Verify Code'),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_sharp),
              onPressed: () {
                navigationService.push(const CreateAccountView());
                // Navigator.of(context).pushReplacementNamed('/create_account');
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: const Text(
                    'A verification code has been sent to you',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    viewModel.buildDigitInput(context, 0),
                    SizedBox(width: 20.w),
                    viewModel.buildDigitInput(context, 1),
                    SizedBox(width: 20.w),
                    viewModel.buildDigitInput(context, 2),
                    SizedBox(width: 20.w),
                    viewModel.buildDigitInput(context, 3),
                  ],
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Didn't receive the code? "),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Retry",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: AppFontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                navigationService.push(const CreateProfileView(selectedGender: '',));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black,
              ),
              child: Text('Send', style: TextStyle(color: AppColors.white)),
            ),
          ),
        );
      },
    );
  }
}
