import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_manager.dart';

TextStyle _getOpenSansTextStyle(
    double fontSize,
    FontWeight fontWeight,
    Color color,
    ) {
  return GoogleFonts.openSans(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

getBodyLargeStyle({double fontSize = AppFontSize.s24, required Color color}) {
  return _getOpenSansTextStyle(fontSize, AppFontWeight.bold, color);
}

getBodyMediumBoldStyle(
    {double fontSize = AppFontSize.s16, required Color color}) {
  return _getOpenSansTextStyle(fontSize, AppFontWeight.semiBold, color);
}

getBodyMediumRegularStyle(
    {double fontSize = AppFontSize.s14, required Color color}) {
  return _getOpenSansTextStyle(fontSize, AppFontWeight.regular, color);
}

getBodySmallStyle({double fontSize = AppFontSize.s12, required Color color}) {
  return _getOpenSansTextStyle(fontSize, AppFontWeight.medium, color);
}

getButtonLabelStyle({double fontSize = AppFontSize.s12, required Color color}) {
  return _getOpenSansTextStyle(fontSize, AppFontWeight.semiBold, color);
}
