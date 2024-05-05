import 'package:flutter/material.dart';
import 'package:safe_chat/views/welcome/widget/intro_content.dart';

import '../../assets_global/exports.dart';
import '../../theme_settings/manager/font_manager.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsGifExport.security),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7),
                  BlendMode.darken,
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IntroContent(
                    title: "About Us",
                    subtitle:
                    "SafeChat serves as your reliable guardian amidst the vast landscape of social media, tirelessly dedicated to preserving"
                        " your online safety. With its primary goal being the protection of your digital journey, SafeChat utilizes advanced computer "
                        "algorithms to thoroughly examine each link that surfaces on your social media feed. Through its constant vigilance, SafeChat meticulously"
                        " evaluates the endless flow of content, always on alert for any signs of potential threats or harmful intentions. Should it detect even the "
                        "faintest indication of danger, SafeChat swiftly springs into action, promptly removing any risky links to shield you from harm. In essence, SafeChat is your "
                        "steadfast companion, ensuring that your online experience remains secure and worry-free",
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Create Account',
                      style: TextStyle(fontWeight: AppFontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(fontWeight: AppFontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}