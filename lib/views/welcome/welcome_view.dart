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
                    "SafeChat stands as your steadfast protector in the vast expanse of social media, tirelessly working to safeguard your online experience. "
                        "With a primary mission of ensuring your digital journey remains unscathed, SafeChat employs sophisticated computer programs to meticulously "
                        "scrutinize each link that appears on your social media feed. Through its unwavering vigilance, SafeChat sifts through the endless stream of content, "
                        "ever on the lookout for any signs of potential danger or malicious intent. And should it detect even the slightest hint of a threat, SafeChat springs "
                        "into action without hesitation, swiftly neutralizing any harmful links to shield you from harm.",
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