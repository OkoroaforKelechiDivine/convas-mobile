import 'package:flutter/material.dart';
import 'package:safe_chat/app_style/manager/theme_manager.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize, letterSpacing, height;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? alignment;
  final TextDecoration? textDecoration;
  const AppText(this.text,
      {Key? key,
        this.fontSize,
        this.fontStyle,
        this.fontWeight,
        this.color,
        this.maxLines,
        this.overflow,
        this.alignment,
        this.fontFamily,
        this.letterSpacing,
        this.textDecoration,
        this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines,
        style: TextStyle(
          color: color ?? AppColors.black,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          fontSize: fontSize,
          overflow: overflow,
          letterSpacing: letterSpacing,
          decoration: textDecoration,
          height: height,
        ),
        textAlign: alignment
    );
  }
}
