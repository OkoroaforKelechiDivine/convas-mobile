import 'package:flutter/material.dart';
import 'package:safe_chat/appConfig/manager/font_manager.dart';

import '../../service/auth_service/auth_service.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  bool emailSent = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'Forgot Password',
            style: TextStyle(
              fontSize: AppFontSize.s18,
              fontWeight: AppFontWeight.light,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset('assets/jpg/padlock.jpg'),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Enter your email below for verification, we will send a 4-digits code to your email',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: _buildEmailInput(),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: _buildSendButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailInput() {
    return TextField(
      controller: emailController,
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildSendButton() {
    return ElevatedButton(
      // onPressed: isLoading ? null : _sendEmail,
      onPressed: (){
        Navigator.of(context).pushReplacementNamed('/check-mail');
      },
      // child: isLoading ? CircularProgressIndicator() : const Text('Send'),
      child: const Text('Send'),
    );
  }

  void _sendEmail() async {
    setState(() {
      isLoading = true;
    });

    // final email = emailController.text;
    // await AuthApiService.forgotPassword(
    //   email: email,
    //   context: context,
    // );
    setState(() {
      isLoading = false;
      emailSent = true;
    });
  }
}