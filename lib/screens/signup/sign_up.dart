import 'package:flutter/material.dart';
import 'package:safe_chat/appConfig/manager/theme_manager.dart';

import '../../appConfig/manager/font_manager.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;

  // Controllers for the text fields
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 30),
                _buildSafeChatLogo(),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: AppFontSize.s20,
                      color: AppColors.activeButton,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildInputField(
                  label: 'First Name',
                  controller: _firstNameController,
                ),
                _buildInputField(
                  label: 'Last Name',
                  controller: _lastNameController,
                ),
                _buildInputField(
                  label: 'Email',
                  controller: _emailController,
                ),
                _buildInputField(
                  label: 'Password',
                  controller: _passwordController,
                  isPassword: true,
                ),
                _buildInputField(
                  label: 'Confirm Password',
                  controller: _confirmPassword,
                  isPassword: true,
                ),
                const SizedBox(height: 60),
                _buildSignUpButton(context),
                Align(
                  alignment: Alignment.centerRight,
                  child: _buildForgotPasswordText(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSafeChatLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Safe Chat',
          style: TextStyle(fontSize: AppFontSize.s20),
        ),
        Image.asset(
          'assets/jpg/safeChatWhiteLogo.jpg',
          height: 40,
        ),
      ],
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: AppColors.blackColor),
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Sign Up'),
    );
  }

  Widget _buildForgotPasswordText() {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          color: AppColors.green,
        ),
      ),
    );
  }
}
