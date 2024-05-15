import 'package:flutter/cupertino.dart';

import '../../../app_style/manager/font_manager.dart';

class CustomButtonText extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;
  final Color color;

  const CustomButtonText({
    required this.text,
    required this.isSelected,
    required this.onPressed,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: isSelected ? AppFontWeight.bold : null,
        color: color
      ),
    );
  }
}