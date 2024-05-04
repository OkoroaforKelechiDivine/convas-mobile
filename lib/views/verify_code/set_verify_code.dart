import 'package:flutter/material.dart';

import '../../../theme_settings/manager/font_manager.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({Key? key}) : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(4, (index) => FocusNode());
    _controllers = List.generate(4, (index) => TextEditingController());

    for (int i = 0; i < 3; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.isNotEmpty) {
          _focusNodes[i].unfocus();
          _focusNodes[i + 1].requestFocus();
        }
      });
    }
  }

  @override
  void dispose() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text(
            'Verify Code',
            style: TextStyle(
              fontSize: AppFontSize.s18,
              fontWeight: AppFontWeight.light,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Enter the verification code',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDigitInput(0),
                const SizedBox(width: 20),
                buildDigitInput(1),
                const SizedBox(width: 20),
                buildDigitInput(2),
                const SizedBox(width: 20),
                buildDigitInput(3),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Did not receive a code"),
                TextButton(
                  onPressed: () {},
                  child: const Text("Resend"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/reset-password');
                },
                child: const Text("Send"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDigitInput(int index) {
    return SizedBox(
      width: 50,
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          counterText: '',
        ),
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        focusNode: _focusNodes[index],
        controller: _controllers[index],
        style: const TextStyle(
          fontSize: AppFontSize.s18,
        ),
      ),
    );
  }
}
