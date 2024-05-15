import 'package:flutter/material.dart';
import '../../app_style/manager/font_manager.dart';
import '../../app_style/manager/theme_manager.dart';

class AppInputField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final double? fontSize;
  final double? borderRadius;
  final String? hintText;
  final bool showBorder;

  const AppInputField({
    Key? key,
    this.onChanged,
    this.fontSize,
    this.hintText,
    this.borderRadius,
    this.showBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        decoration: showBorder ? BoxDecoration(
          border: Border.all(color: AppColors.grey),
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
        ) : null,
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(fontSize: AppFontSize.s14),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
