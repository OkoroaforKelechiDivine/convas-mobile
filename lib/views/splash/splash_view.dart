import 'package:flutter/material.dart';
import 'package:safe_chat/assets_global/exports.dart';
import 'package:stacked/stacked.dart';

import '../../view_models/splash/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) {
          viewModel.initializeSplashScreen();
        },
        viewModelBuilder: () => SplashScreenViewModel(),
        builder: (context, model, _) {
          return Scaffold(
            body: Center(
              child: Image.asset(AssetsImageExport.splashLogo,
              ),
            ),
          );
        }
    );
  }
}
