import 'package:flutter/material.dart';

import '../../../app_style/manager/font_manager.dart';
import '../../../app_style/manager/style_manager.dart';
import '../../../app_style/manager/theme_manager.dart';

class AppTextField extends StatefulWidget {
  final String? labelText;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? isEmpty;
  final void Function()? onChanged;
  final bool obscureText;

  const AppTextField({
    Key? key,
    this.labelText,
    this.errorText,
    this.keyboardType,
    this.controller,
    this.isEmpty,
    this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText && widget.obscureText,
      cursorColor: AppColors.black,
      onChanged: (_) {
        widget.onChanged?.call();
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        errorText: widget.isEmpty == false ? null : widget.errorText,
        labelStyle: getBodySmallStyle(
          color: AppColors.black,
          fontSize: AppFontSize.s14,
        ),
        hintStyle: getBodySmallStyle(
          color: AppColors.black,
          fontSize: AppFontSize.s14,
        ),
        fillColor: AppColors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: AppColors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: AppColors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: AppColors.black,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        suffixIcon: widget.labelText == 'Password' || widget.labelText == 'Confirm Password' ? IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility ,
            color: AppColors.black,
          ),
        ) : null,
      ),
    );
  }
}