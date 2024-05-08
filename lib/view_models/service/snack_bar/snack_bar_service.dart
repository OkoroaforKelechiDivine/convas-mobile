import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../../core/di/locator.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/done_icon.dart';
import '../../../theme_settings/manager/theme_manager.dart';
import '../navigations/navigation_service.dart';


class SnackbarService {
  final NavigationService _navigationService = navigationService ;
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  void error({
    required String message,
    int milliseconds = 3000,
  }) {
    showOverlayNotification((con) {
        return SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Material(
              elevation: 8,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                        stops: [0.02, 0.02],
                        colors: [Colors.red, Colors.white]
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8))
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
                        fontSize: 20,
                        color: AppColors.green,
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
        int milliseconds = 3000,
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
                  color: Colors.white,
                  gradient: LinearGradient(
                      stops: const [0.02, 0.02],
                      colors: [AppColors.green, Colors.white]),
                  borderRadius: const BorderRadius.all(Radius.circular(8))
              ),
              padding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DoneIcon(
                    size: 36,
                    color: AppColors.green,
                    iconColor: Colors.white,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child:
                    AppText(message, fontSize: 18, color: AppColors.green),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }, context: _navigationService.navigatorKey.currentContext);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccessSnackBar(
      String text,
      ) {
    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Text(text),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnackBar(
      String text,
      ) {
    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(text),
      ),
    );
  }
}
