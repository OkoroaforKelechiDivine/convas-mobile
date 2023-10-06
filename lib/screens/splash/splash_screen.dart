import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Widget _buildLogoImage() {
    return Center(
      child: Image.asset(
        'assets/jpg/safeChatLogo.jpg',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLogoImage(),
        ],
      ),
    );
  }
}
