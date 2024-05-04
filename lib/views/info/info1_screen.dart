import 'package:flutter/material.dart';

import '../../../theme_settings/manager/font_manager.dart';
import '../../../theme_settings/manager/theme_manager.dart';


class InfoOneScreen extends StatelessWidget {
  const InfoOneScreen({Key? key}) : super(key: key);

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
              children: [
                _buildSafeChatLogo(),
                const SizedBox(height: 50),
                _buildImage(),
                const SizedBox(height: 100),
                _buildButtons(context),
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

  Widget _buildImage() {
    return Image.asset(
      'assets/jpg/illustration.jpg',
      height: 200,
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.activeButton,
            backgroundColor: AppColors.white,
            side: BorderSide(
                color: AppColors.activeButton
            )
          ),
          child: const Text('Login'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/info2');
          },
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}
