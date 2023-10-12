import 'package:flutter/material.dart';
import 'package:safe_chat/appConfig/manager/theme_manager.dart';

import '../../appConfig/manager/font_manager.dart';
import '../../service/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                _buildSafeChatLogo(),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: AppFontSize.s20,
                      color: AppColors.activeButton,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildEmailField(),
                _buildPasswordField(),
                const SizedBox(height: 60),
                _buildLoginButton(context),
                Align(
                  alignment: Alignment.centerRight,
                  child: _buildForgotPasswordText(context),
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

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      style: TextStyle(color: AppColors.blackColor),
      decoration: InputDecoration(
        labelText: 'Email',
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

  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordController,
      style: TextStyle(color: AppColors.blackColor),
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: AppColors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      // onPressed: _isLoading ? null : () => _performLogin(context),
      onPressed: (){},
      // child: _isLoading ? CircularProgressIndicator(color: AppColors.activeButton,) : const Text('Log in'),
      child: const Text('Log in'),
    );
  }

  Widget _buildForgotPasswordText(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/forget-password');
      },
      child: const Text(
        'Forgot Password?'
      ),
    );
  }

  void _performLogin(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;

    setState(() {
      _isLoading = true;
    });

    await AuthApiService.login(
        email: email,
        password: password,
        context:  context
    );

    setState(() {
      _isLoading = false;
    });
  }
}
