import 'package:flutter/material.dart';

import '../../../theme_settings/manager/font_manager.dart';
import '../../../theme_settings/manager/style_manager.dart';
import '../../../theme_settings/manager/theme_manager.dart';

Widget getAppTextField({String? labelText, String? errorText, TextInputType? keyboardType, TextEditingController? controller, bool obscureText = false, bool? isEmpty, void Function()? onChanged}) {
  return TextField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    cursorColor: AppColors.blackColor,
    onChanged: (_) {
      onChanged?.call();
    },
    decoration: InputDecoration(
      labelText: labelText,
      errorText: isEmpty == false ? null : errorText,
      labelStyle: getBodySmallStyle(
        color: AppColors.blackColor,
        fontSize: AppFontSize.s14,
      ),
      hintStyle: getBodySmallStyle(
        color: AppColors.blackColor,
        fontSize: AppFontSize.s14,
      ),
      fillColor: AppColors.white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: AppColors.blackColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: AppColors.blackColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: AppColors.blackColor,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      suffixIcon: labelText == 'Password' || labelText == 'Confirm Password' ? IconButton(
        onPressed: () {
          obscureText = !obscureText;
        },
        icon: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
          color: AppColors.blackColor,
        ),
      )
          : null,
    ),
  );
}