import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(milliseconds: 8000), () {
      Get.offNamed("/info1");
    });
  }
}
