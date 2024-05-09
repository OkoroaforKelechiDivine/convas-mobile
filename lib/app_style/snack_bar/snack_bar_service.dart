import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../locator/locator.dart';
import '../../service/navigations/navigation_service.dart';
import '../../utilities/widgets/app_text.dart';
import '../../utilities/widgets/done_icon.dart';
import '../manager/font_manager.dart';
import '../manager/theme_manager.dart';


class SnackBarService {
  final NavigationService _navigationService = navigationService ;
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  void error({
    required String message,
    int milliseconds = 5000,
  }) {
    showOverlayNotification((con) {
        return SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Material(
              elevation: 8,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    gradient: LinearGradient(
                        stops: const [0.02, 0.02],
                        colors: [Colors.red, AppColors.white]
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8))
                ),
                padding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 32,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      child: AppText(
                        message,
                        fontSize: AppFontSize.s14,
                        color: AppColors.blackColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void success(
      {required String message,
        String? title,
        int milliseconds = 5000,
        double? startFrom}) {
    showOverlayNotification((con) {
      return SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Material(
            elevation: 8,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  gradient: LinearGradient(
                      stops: const [0.02, 0.02],
                      colors: [AppColors.green, AppColors.white]
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8))
              ),
              padding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DoneIcon(
                    size: 36,
                    color: AppColors.green,
                    iconColor: AppColors.white,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child:
                    AppText(message, fontSize: AppFontSize.s14, color: AppColors.blackColor),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }, context: _navigationService.navigatorKey.currentContext);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccessSnackBar(String text) {
    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Text(text),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnackBar(String text) {
    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(text),
      ),
    );
  }
}
