import 'package:flutter/material.dart';
import '../../app_style/manager/theme_manager.dart';
import 'app_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String buttonText;
  final EdgeInsetsGeometry padding;
  final String? title;
  final double? width;
  final double? height;
  final double? radius;

  const CustomElevatedButton({
    Key? key,
    this.onPressed,
    this.isLoading = false,
    required this.buttonText,
    this.padding = const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
    this.title,
    this.width,
    this.height,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: padding,
        backgroundColor: AppColors.blackColor,
        minimumSize: Size(width ?? double.infinity, height ?? 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 0),
        ),
      ),
      child: isLoading
          ? SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
        ),
      )
          : AppText(buttonText, color: AppColors.white),
    );
  }
}
