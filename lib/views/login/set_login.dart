import 'package:flutter/material.dart';

import '../../../theme_settings/manager/font_manager.dart';
import '../../../theme_settings/manager/theme_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _emailError = false;
  bool _passwordError = false;

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
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Center(
                    child: Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: AppFontSize.s20,
                        color: AppColors.activeButton,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
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
          'SafeChat',
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
          borderSide: BorderSide(
            color: _emailError ? Colors.red : AppColors.grey,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: _emailError ? Colors.red : AppColors.grey,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
        ),
        errorText: _emailError ? 'Email cannot be empty' : null,
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
          borderSide: BorderSide(
            color: _passwordError ? Colors.red : AppColors.grey,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: _passwordError ? Colors.red : AppColors.grey,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
        ),
        errorText: _passwordError ? 'Password cannot be empty' : null,
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
      onPressed: _isLoading ? null : () => _performLogin(context),
      child: _isLoading ? CircularProgressIndicator(color: AppColors.activeButton,) : const Text('Log in'),
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

    if (email.isEmpty) {
      setState(() {
        _emailError = true;
      });
      return;
    } else {
      setState(() {
        _emailError = false;
      });

      if (password.isEmpty) {
        setState(() {
          _passwordError = true;
        });
        return;
      } else {
        setState(() {
          _passwordError = false;
        });
      }

      setState(() {
        _isLoading = true;
      });

      // await AuthApiService.loginUser(
      //   email: email,
      //   password: password,
      //   context: context,
      // );

      setState(() {
        _isLoading = false;
      });
    }
  }
}
