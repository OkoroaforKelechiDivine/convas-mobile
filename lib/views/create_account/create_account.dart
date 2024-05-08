import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:safe_chat/views/create_account/widget/get_dropdown_button.dart';
import '../../theme_settings/manager/theme_manager.dart';
import '../../view_models/create_account/create_account_view_model.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CreateAccountViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text('Create Account'),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_sharp),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/info1');
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Please register with the correct information and sign up to continue using our app.'),
                  SizedBox(height: 40.h),
                  getAppTextField(labelText: 'First Name'),
                  SizedBox(height: 20.h),
                  getAppTextField(labelText: 'Last Name'),
                  SizedBox(height: 20.h),
                  getAppTextField(labelText: 'Email'),
                  SizedBox(height: 20.h),
                  getAppTextField(labelText: 'Password'),
                  SizedBox(height: 20.h),
                  getAppTextField(labelText: 'Confirm Password'),
                  SizedBox(height: 20.h),
                  GenderSelectionWidget(
                    selectedValue: viewModel.selectedGender,
                    onChanged: viewModel.updateSelectedGender,
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Have an account already? "),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/verify_code');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blackColor,
              ),
              child: Text('Create account', style: TextStyle(color: AppColors.white)),
            ),
          ),
        );
      },
    );
  }
}