import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_manager.dart';

String _defaultFontFamily = 'Spectral';

TextStyle _getSpectralTextStyle(
    double fontSize,
    FontWeight fontWeight,
    Color color,
    ) {
  return GoogleFonts.getFont(
    _defaultFontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

const double _defaultFontSize = AppFontSize.s12;

getBodyLargeStyle({double fontSize = AppFontSize.s24, required Color color}) {
  return _getSpectralTextStyle(fontSize, AppFontWeight.bold, color);
}

getBodyMediumBoldStyle(
    {double fontSize = AppFontSize.s16, required Color color}) {
  return _getSpectralTextStyle(fontSize, AppFontWeight.semiBold, color);
}

getBodyMediumRegularStyle(
    {double fontSize = AppFontSize.s14, required Color color}) {
  return _getSpectralTextStyle(fontSize, AppFontWeight.regular, color);
}

getBodySmallStyle({double fontSize = _defaultFontSize, required Color color}) {
  return _getSpectralTextStyle(fontSize, AppFontWeight.medium, color);
}

getButtonLabelStyle({double fontSize = _defaultFontSize, required Color color}) {
  return _getSpectralTextStyle(fontSize, AppFontWeight.semiBold, color);
}
