import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_chat/assets_global/exports.dart';

import '../../model/service/splash/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(AssetsImageExport.splashLogo,
            ),
          ),
        ],
      ),
    );
  }
}
