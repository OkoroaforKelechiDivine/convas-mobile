import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safe_chat/utilities/widgets/app_text.dart';
import 'package:safe_chat/views/create_account/widget/get_text_field.dart';
import 'package:stacked/stacked.dart';
import 'package:safe_chat/views/create_account/widget/get_dropdown_button.dart';
import '../../app_style/manager/theme_manager.dart';
import '../../utilities/widgets/app_button.dart';
import '../../view_models/create_account/create_account_view_model.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAccountViewModel>.reactive(
      viewModelBuilder: () => CreateAccountViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.only(left: 50),
              child: AppText('Create Account'),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_sharp),
              onPressed: () {
                viewModel.navigateToWelcomeScreen(context);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 2),
            child: ListView(
              shrinkWrap: true,
              children: [
                const AppText('Please register with the correct information and sign up to continue using our app.'),
                SizedBox(height: 30.h),
                AppTextField(
                  labelText: 'First Name',
                  controller: viewModel.firstName,
                  errorText: viewModel.firstNameError,
                  onChanged: viewModel.clearFirstNameError,
                ),
                SizedBox(height: 20.h),
                AppTextField(
                  controller: viewModel.lastName,
                  labelText: 'Last Name',
                  errorText: viewModel.lastNameError,
                  onChanged: viewModel.clearLastNameError,
                ),
                SizedBox(height: 20.h),
                AppTextField(
                  labelText: 'Phone Number',
                  keyboardType: TextInputType.number,
                  controller: viewModel.phoneNumber,
                  errorText: viewModel.phoneNumberError,
                  onChanged: viewModel.clearPhoneNumberError,
                ),
                SizedBox(height: 20.h),
                AppTextField(
                  labelText: 'Password',
                  controller: viewModel.password,
                  errorText: viewModel.passwordError,
                  obscureText: true,
                  onChanged: viewModel.clearPasswordError,
                ),
                SizedBox(height: 20.h),
                AppTextField(
                  labelText: 'Confirm Password',
                  controller: viewModel.confirmPassword,
                  errorText: viewModel.confirmPasswordError,
                  obscureText: true,
                  onChanged: viewModel.clearConfirmPasswordError,
                ),
                SizedBox(height: 20.h),
                GenderSelectionWidget(
                  selectedValue: viewModel.selectedGender,
                  onChanged: viewModel.updateSelectedGender,
                  controller: viewModel.gender,
                  errorText: viewModel.genderError,
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const AppText("Have an account already? "),
                    InkWell(
                      onTap: () {},
                      child: AppText(
                        "Login",
                        color: AppColors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 0),
            child: Stack(
              children: [
                CustomElevatedButton(
                  onPressed: () {
                    viewModel.createAccount(() {
                      CreateAccountViewModel.navigateToVerifyCodeScreen();
                    });
                  },
                  radius: 8.r,
                  isLoading: viewModel.isLoading,
                  buttonText: "Create Account",
                ),
              ],
            ),
          ),

        );
      },
    );
  }
}