import 'package:flutter/material.dart';
import 'package:safe_chat/appConfig/manager/font_manager.dart';

class InfoTwoScreen extends StatelessWidget {
  const InfoTwoScreen({Key? key}) : super(key: key);

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
                const SizedBox(height: 20),
                _buildChatConfidentlyText(),
                _buildAdditionalText(),
                const SizedBox(height: 100),
                _buildGetStartedButton(context),
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
      'assets/jpg/pana.jpg',
      height: 200,
    );
  }

  Widget _buildChatConfidentlyText() {
    return const Text(
      'Chat Confidently,',
      style: TextStyle(fontSize: AppFontSize.s18),
    );
  }

  Widget _buildAdditionalText() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "We've got your",
            style: TextStyle(fontSize: AppFontSize.s18),
          ),
          Text(
            'back.',
            style: TextStyle(fontSize: AppFontSize.s18),
          ),
        ],
      ),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/info2');
      },
      child: const Text('Get Started'),
    );
  }

}
