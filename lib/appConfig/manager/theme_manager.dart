import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:safe_chat/appConfig/manager/font_manager.dart';
import 'package:safe_chat/appConfig/manager/style_manager.dart';

class AppColors {
  static Color appBackgroundColor = HexColor.fromHex('#000');
  static Color text = Colors.white;
  static Color blackColor = const Color.fromRGBO(0, 0, 0, 1);
  static Color activeButton = HexColor.fromHex('#3AF9EF');
  static Color placeholderColor = HexColor.fromHex("#ABDECC");
  static Color borderColor = const Color.fromRGBO(58, 249, 239, 1);

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
      titleLarge: getBodyLargeStyle(color: AppColors.text),
      bodyLarge: getBodyMediumBoldStyle(color: AppColors.text),
      bodyMedium: getBodyMediumRegularStyle(color: AppColors.text),
      bodySmall: getBodySmallStyle(color: AppColors.text),
      labelSmall: getButtonLabelStyle(color: AppColors.text)
  ),
  scaffoldBackgroundColor: AppColors.appBackgroundColor,
  appBarTheme:
  const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.activeButton,
        textStyle: getBodySmallStyle(
            color: AppColors.activeButton,
            fontSize: AppFontSize.s14
        ),
      )),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(350, 70),
        backgroundColor: AppColors.text,
        foregroundColor: AppColors.appBackgroundColor,
        textStyle: getBodySmallStyle(
            color: AppColors.appBackgroundColor,
            fontSize: AppFontSize.s14
        ),
      )),
  inputDecorationTheme: InputDecorationTheme(
      hintStyle: getBodySmallStyle(
          color: AppColors.appBackgroundColor,
          fontSize: AppFontSize.s14
      ),
      fillColor: AppColors.placeholderColor.withOpacity(0.3),
      filled: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)
      )
  ),
  primarySwatch: Colors.grey,
);

getApplicationTheme() {
  return _appTheme;
}