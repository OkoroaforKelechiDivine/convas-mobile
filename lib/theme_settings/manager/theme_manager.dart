import 'package:flutter/material.dart';
import 'package:safe_chat/theme_settings/manager/style_manager.dart';

import 'font_manager.dart';

class AppColors {
  static Color white = Colors.white;
  static Color blackColor = const Color.fromRGBO(0, 0, 0, 1);
  static Color activeButton = HexColor.fromHex('#3D49B8');
  static Color green = HexColor.fromHex('#3DB86E');
  static Color grey = HexColor.fromHex('#848586');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

ThemeData _appTheme = ThemeData(
  textTheme: TextTheme(
      titleLarge: getBodyLargeStyle(color: AppColors.blackColor),
      bodyLarge: getBodyMediumBoldStyle(color: AppColors.blackColor),
      bodyMedium: getBodyMediumRegularStyle(color: AppColors.blackColor),
      bodySmall: getBodySmallStyle(color: AppColors.blackColor),
      labelSmall: getButtonLabelStyle(color: AppColors.blackColor)
  ),
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: AppBarTheme(backgroundColor: AppColors.white, elevation: 0),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.green,
        textStyle: getBodySmallStyle(
            color: AppColors.green,
            fontSize: AppFontSize.s14
        ),
      )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(500, 50),
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.blackColor,
      textStyle: getBodySmallStyle(
        color: AppColors.white,
        fontSize: AppFontSize.s14,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(
          color: AppColors.blackColor,
        ),
      ),
    ),
  ),
  primarySwatch: Colors.grey,
);

getApplicationTheme() {
  return _appTheme;
}