import 'package:flutter/material.dart';

import '../../app_style/manager/font_manager.dart';

class ResetPasscodeScreen extends StatefulWidget {
  const ResetPasscodeScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasscodeScreen> createState() => _ResetPasscodeScreenState();
}

class _ResetPasscodeScreenState extends State<ResetPasscodeScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              _buildPasswordInputField(
                controller: newPasswordController,
                label: 'New Password',
              ),
              const SizedBox(height: 20),
              _buildPasswordInputField(
                controller: confirmPasswordController,
                label: 'Confirm Password',
              ),
              const SizedBox(height: 20),
              _buildResetPasswordButton(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.only(left: 50),
        child: Text(
          'Reset Password',
          style: TextStyle(
            fontSize: AppFontSize.s18,
            fontWeight: AppFontWeight.light,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordInputField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildResetPasswordButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed('/login');
      },
      child: const Text('Reset Password'),
    );
  }
}
