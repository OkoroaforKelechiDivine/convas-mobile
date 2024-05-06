import 'package:flutter/material.dart';
import 'package:safe_chat/theme_settings/manager/font_manager.dart';
import 'package:safe_chat/views/create_account/widget/get_dropdown_button.dart';
import '../../theme_settings/manager/theme_manager.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  _CreateAccountViewState createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create an account'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Please register with the correct information and sign up to continue using our app.'),
              const SizedBox(height: 40),
              getAppTextField(labelText: 'First Name'),
              const SizedBox(height: 20),
              getAppTextField(labelText: 'Last Name'),
              const SizedBox(height: 20),
              getAppTextField(labelText: 'Email'),
              const SizedBox(height: 20),
              getAppTextField(labelText: 'Password'),
              const SizedBox(height: 20),
              getAppTextField(labelText: 'Confirm Password'),
              const SizedBox(height: 20),
              GenderSelectionWidget(
                selectedValue: selectedGender,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGender = newValue;
                  });
                },
              ),
              const SizedBox(height: 30),
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
                        fontWeight: AppFontWeight.bold,
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
            backgroundColor: AppColors.blackColor
          ),
          child: Text('Create account', style: TextStyle(color: AppColors.white)),
        ),
      ),
    );
  }
}
