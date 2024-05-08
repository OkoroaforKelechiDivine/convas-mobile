import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../theme_settings/manager/font_manager.dart';
import '../../theme_settings/manager/theme_manager.dart';
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
                Navigator.of(context).pushReplacementNamed('/create_account');
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
                Navigator.of(context).pushReplacementNamed('/create_profile');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blackColor,
              ),
              child: Text('Send', style: TextStyle(color: AppColors.white)),
            ),
          ),
        );
      },
    );
  }
}