import 'package:flutter/material.dart';

import '../../appConfig/manager/font_manager.dart';
import '../../appConfig/manager/theme_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/jpg/background_image.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildLogoImage(),
                    const SizedBox(height: 20),
                    _buildWelcomeText(),
                    const SizedBox(height: 200),
                    _buildLoginButton(context, 'Sign in', Icons.arrow_forward, () { Navigator.pushNamed(context, '/login'); }),
                    const SizedBox(height: 20),
                    _buildLoginButton(context, 'Sign up', Icons.arrow_forward, () {},
                      backgroundColor: AppColors.blackColor,
                      borderColor: AppColors.borderColor,
                      textColor: AppColors.borderColor,
                      iconColor: AppColors.borderColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoImage() {
    return Image.asset(
      'assets/jpg/safeChatLogo.jpg',
      width: 100,
      height: 100,
    );
  }

  Widget _buildWelcomeText() {
    return const Text(
      'Welcome back',
      style: TextStyle(
        fontSize: AppFontSize.s24,
        fontWeight: AppFontWeight.bold,
      ),
    );
  }

  Widget _buildLoginButton(
      BuildContext context,
      String text,
      IconData iconData,
      VoidCallback onPressed, {
        Color? backgroundColor,
        Color? borderColor,
        Color? textColor,
        Color? iconColor,
      }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ), backgroundColor: backgroundColor ?? AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: textColor ?? AppColors.blackColor,
            ),
          ),
          Icon(
            iconData,
            color: iconColor ?? AppColors.blackColor,
          ),
        ],
      ),
    );
  }
}