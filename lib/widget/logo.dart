import 'package:flutter/material.dart';
import 'package:safe_chat/appConfig/manager/font_manager.dart';

class SafeChatLogo extends StatelessWidget {
  const SafeChatLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Convas',
          style: TextStyle(fontSize: AppFontSize.s24),
        ),
        const SizedBox(width: 2),
        Image.asset(
          'assets/jpg/safeChatWhiteLogo.jpg',
          height: 20,
        ),
      ],
    );
  }
}
