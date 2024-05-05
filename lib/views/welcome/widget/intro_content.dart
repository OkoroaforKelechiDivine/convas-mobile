import 'package:flutter/material.dart';
import 'package:safe_chat/theme_settings/manager/theme_manager.dart';

import '../../../theme_settings/manager/font_manager.dart';


class IntroContent extends StatelessWidget {
  final String title;
  final String subtitle;

  const IntroContent({Key? key, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: AppFontSize.s24,
            fontWeight: AppFontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          subtitle,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
