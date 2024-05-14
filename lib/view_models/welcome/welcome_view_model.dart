import 'package:flutter/material.dart';
import 'package:safe_chat/views/create_account/create_account.dart';
import 'package:stacked/stacked.dart';
import '../../locator/locator.dart';
import '../../utilities/constants/app_assets/assets.dart';

class WelcomeViewModel extends BaseViewModel{

  void navigateToCreateAccount(BuildContext context) {
    navigationService.pushReplacement(const CreateAccountView());
  }

  List<Map<String, String>> imageData = [
    {
      'image': AssetsImageExport.hello,
      'title': 'Connect with the world 🌍',
      'text': "Join SafeChat and wave hello to endless\n opportunities! From making new friends\n"
          " to sharing your stories"
    },
    {
      'image': AssetsImageExport.need,
      'title': 'Worry-Free Social Feeds  🔒',
      'text': 'With SafeChat you can scroll through your social \nfeeds, worry-free where every link is checked for safety. \n'
          'Embrace peace of mind as harmful content is swiftly eliminated with our powerful algorithm',
    },
  ];

  int _currentCarouselIndex = 0;

  int get currentCarouselIndex => _currentCarouselIndex;

  void setCarouselIndex(int index) {
    _currentCarouselIndex = index;
    notifyListeners();
  }
}
