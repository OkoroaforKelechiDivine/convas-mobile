import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(milliseconds: 10000), (){
      Get.off(() => const Text("data"));
    });
  }
}