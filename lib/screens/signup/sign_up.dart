import 'package:flutter/material.dart';
import 'package:safe_chat/appConfig/manager/theme_manager.dart';

import '../../appConfig/manager/font_manager.dart';
import '../../service/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String _firstNameError = '';
  String _lastNameError = '';
  String _emailError = '';
  String _passwordError = '';
  String _confirmPasswordError = '';

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
                const SizedBox(height: 50),
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
                  hint: 'First Name',
                  controller: _firstNameController,
                  errorText: _firstNameError,
                ),
                _buildInputField(
                  hint: 'Last Name',
                  label: 'Last Name',
                  controller: _lastNameController,
                  errorText: _lastNameError,
                ),
                _buildInputField(
                  hint: 'Email',
                  label: 'Email',
                  controller: _emailController,
                  errorText: _emailError,
                ),
                _buildInputField(
                  label: 'Password',
                  hint: 'Mypassword123@#',
                  controller: _passwordController,
                  isPassword: true,
                  obscureText: _obscurePassword,
                  toggleVisibility: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  errorText: _passwordError,
                ),
                _buildInputField(
                  label: 'Confirm Password',
                  hint: 'Confirm Password',
                  controller: _confirmPassword,
                  isPassword: true,
                  obscureText: _obscureConfirmPassword,
                  toggleVisibility: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                  errorText: _confirmPasswordError,
                ),
                const SizedBox(height: 60),
                _buildSignUpButton(context),
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
    required String hint,
    required TextEditingController controller,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? toggleVisibility,
    required String errorText,
  }) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: AppColors.blackColor),
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.grey),
        labelStyle: TextStyle(color: AppColors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.green,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.green,
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
        errorText: errorText.isNotEmpty ? errorText : null,
        enabled: !_isLoading,
        suffixIcon: isPassword ? IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: toggleVisibility,
        )
            : null,
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return ElevatedButton(
      // onPressed: _isLoading ? null : _performSignUp,
      onPressed: (){},
      // child: _isLoading ? CircularProgressIndicator(color: AppColors.activeButton,) : const Text('Sign Up'),
      child: const Text('Sign Up'),
    );
  }

  void _performSignUp() async {
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    setState(() {
      _firstNameError = '';
      _lastNameError = '';
      _emailError = '';
      _passwordError = '';
      _confirmPasswordError = '';
      _isLoading = true;
    });

    if (firstName.isEmpty) {
      setState(() {
        _firstNameError = 'First name cannot be empty';
        _isLoading = false;
      });
      return;
    }

    if (lastName.isEmpty) {
      setState(() {
        _lastNameError = 'Last name cannot be empty';
        _isLoading = false;
      });
      return;
    }

    if (email.isEmpty) {
      setState(() {
        _emailError = 'Email cannot be empty';
        _isLoading = false;
      });
      return;
    }
    if (!RegExp(
        r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!])(?=\S+$).{8,}$")
        .hasMatch(password)) {
      setState(() {
        _passwordError = 'Password is weak';
        _isLoading = false;
      });
      return;
    }

    if (!RegExp(r"^[A-Za-z0-9+_.-]+@(.+)$").hasMatch(email)) {
      setState(() {
        _emailError = 'Invalid email address';
        _isLoading = false;
      });
      return;
    }

    if (password != _confirmPassword.text) {
      setState(() {
        _confirmPasswordError = 'Passwords do not match';
        _isLoading = false;
      });
      return;
    }

    await AuthApiService.registerUser(
      context: context,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );

    setState(() {
      _isLoading = false;
    });
  }
}
