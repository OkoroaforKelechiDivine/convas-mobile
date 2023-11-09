import 'package:flutter/material.dart';
import '../../appConfig/manager/font_manager.dart';
import '../../appConfig/manager/theme_manager.dart';
import '../../service/auth_service/auth_service.dart';
import '../../service/validation/field_validation.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthApiService apiService = AuthApiService();

  bool isBusy = false;
  String firstNameError = '';
  String lastNameError = '';
  String emailError = '';
  String passwordError = '';
  String registrationError = '';

  bool obscurePassword = true;

  Future<void> signUp() async {
    clearErrors();

    if (validateField(firstNameController, (error) => firstNameError = error) ||
        validateField(lastNameController, (error) => lastNameError = error) ||
        validateEmail(emailController) ||
        validatePassword(passwordController)) {
      return;
    }

    setState(() {
      isBusy = true;
    });

    final result = await apiService.registerUser(
      context: context,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    setState(() {
      isBusy = false;
      if (result['error'] != null) {
        registrationError = result['error'];
      }
    });
  }

  void clearErrors() {
    setState(() {
      firstNameError = '';
      lastNameError = '';
      emailError = '';
      passwordError = '';
      registrationError = '';
    });
  }

  bool validateField(TextEditingController controller, void Function(String) onError) {
    final value = controller.text;
    if (FieldValidation.isFieldEmpty(value)) {
      onError('Field cannot be empty');
      return true;
    }
    return false;
  }

  bool validateEmail(TextEditingController controller) {
    final email = controller.text;
    if (!FieldValidation.isEmailValid(email)) {
      setState(() {
        emailError = 'Invalid email format';
      });
      return true;
    }
    return false;
  }

  bool validatePassword(TextEditingController controller) {
    final password = controller.text;
    if (!FieldValidation.isPasswordStrong(password)) {
      setState(() {
        passwordError = 'Password must be at least 8 characters and contain letters, digits, and special characters.';
      });
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/info1');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Welcome to ',
                      style: TextStyle(
                        fontSize: AppFontSize.s20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                    TextSpan(
                      text: "Convas",
                      style: TextStyle(
                        fontSize: AppFontSize.s20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.activeButton,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),
              _buildTextField(firstNameController, 'First Name', firstNameError),
              _buildTextField(lastNameController, 'Last Name', lastNameError),
              _buildTextField(emailController, 'Email', emailError),
              _buildTextField(passwordController, 'Password', passwordError, isPassword: true),
              if (registrationError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    registrationError,
                    style: TextStyle(
                      color: AppColors.red,
                    ),
                  ),
                ),
              const SizedBox(height: 10),
              Stack(
                alignment: Alignment.center,
                children: [
                  ElevatedButton(
                    onPressed: isBusy ? null : signUp,
                    child: const Text('Create account'),
                  ),
                  if (isBusy) CircularProgressIndicator(color: AppColors.activeButton),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, String error, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              contentPadding: EdgeInsets.zero,
              border: const UnderlineInputBorder(),
              errorText: error.isEmpty ? null : error,
            ),
            obscureText: isPassword && !obscurePassword,
          ),
          if (isPassword)
            Positioned(
              right: 0,
              bottom: 8,
              child: IconButton(
                icon: Icon(obscurePassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),
            ),
        ],
      ),
    );
  }
}