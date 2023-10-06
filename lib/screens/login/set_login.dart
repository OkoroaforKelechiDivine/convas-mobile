import 'package:flutter/material.dart';

import '../../appConfig/manager/font_manager.dart';
import '../../appConfig/manager/theme_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/jpg/background_image.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildLogoImage(),
                    const SizedBox(height: 20),
                    _buildWelcomeText(),
                    const SizedBox(height: 100),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: AppFontSize.s24,
                          color: AppColors.white,
                          fontWeight: AppFontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildUsernameField(),
                    const SizedBox(height: 20),
                    _buildPasswordField(),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _buildForgotPasswordText(),
                    ),
                    const SizedBox(height: 60),
                    _buildLoginButton(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoImage() {
    return Image.asset(
      'assets/jpg/safeChatLogo.jpg',
      width: 100,
      height: 100,
    );
  }

  Widget _buildWelcomeText() {
    return Text(
      'Welcome back',
      style: TextStyle(
        fontSize: AppFontSize.s24,
        fontWeight: AppFontWeight.bold,
        color: AppColors.white,
      ),
    );
  }

  Widget _buildUsernameField() {
    return TextFormField(
      style: TextStyle(color: AppColors.white),
      decoration: InputDecoration(
        labelText: 'Username',
        labelStyle: TextStyle(color: AppColors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      style: TextStyle(color: AppColors.white),
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: AppColors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign in',
            style: TextStyle(
              color: AppColors.blackColor,
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.arrow_forward,
            color: AppColors.blackColor,
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPasswordText() {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          color: AppColors.borderColor,
        ),
      ),
    );
  }
}
