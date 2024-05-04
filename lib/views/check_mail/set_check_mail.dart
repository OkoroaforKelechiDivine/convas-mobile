import 'package:flutter/material.dart';

class CheckMailScreen extends StatefulWidget {
  const CheckMailScreen({Key? key}) : super(key: key);

  @override
  State<CheckMailScreen> createState() => _CheckMailScreenState();
}

class _CheckMailScreenState extends State<CheckMailScreen> {
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
        title: const Text(""),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset('assets/jpg/check_your_mail.jpg', width: 70),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "We've Sent you a verification code ",
                  textAlign: TextAlign.center,
                ),
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

  Widget _buildSendButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed('/verify_code');
      },
      child: const Text("Seen"),
    );
  }
}