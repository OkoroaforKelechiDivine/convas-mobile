import 'package:flutter/material.dart';
import '../../app_style/manager/font_manager.dart';
import '../../app_style/manager/theme_manager.dart';

class AppInputField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final double? fontSize;
  final double? height;
  final double? borderRadius;
  final String? hintText;

  const AppInputField({
    Key? key,
    this.onChanged,
    this.fontSize,
    this.height,
    this.hintText,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 100,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(borderRadius ?? 5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
