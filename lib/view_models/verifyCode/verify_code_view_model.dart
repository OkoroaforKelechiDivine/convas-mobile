import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../app_style/manager/font_manager.dart';
import '../../app_style/manager/theme_manager.dart';

class VerifyCodeViewModel extends BaseViewModel {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  VerifyCodeViewModel() {
    _focusNodes = List.generate(4, (index) => FocusNode());
    _controllers = List.generate(4, (index) => TextEditingController());

    for (int index = 0; index < 4; index++) {
      _controllers[index].addListener(() {
        String value = _controllers[index].text;
        if (value.isNotEmpty) {
          if (index < 3) {
            _focusNodes[index].unfocus();
            _focusNodes[index + 1].requestFocus();
          }
        }
      });
    }
  }

  void dispose() {
    _focusNodes.forEach((focusNode) => focusNode.dispose());
    _controllers.forEach((controller) => controller.dispose());
  }

  Widget buildDigitInput(BuildContext context, int index) {
    return SizedBox(
      width: 50.w,
      height: 60.h,
      child: TextField(
        cursorColor: AppColors.blackColor,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: AppColors.blackColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: AppColors.blackColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: AppColors.blackColor,
            ),
          ),
          counterText: '',
        ),
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        onChanged: (String value) {
          if (value.isNotEmpty && value != " ") {
            if (index < 3) {
              _focusNodes[index].unfocus();
              _focusNodes[index + 1].requestFocus();
            }
          } else {
            if (index > 0) {
              _focusNodes[index].unfocus();
              _focusNodes[index - 1].requestFocus();
            }
          }
        },
        onEditingComplete: () {
          String value = _controllers[index].text;
          if (value.isEmpty && index > 0) {
            _focusNodes[index].unfocus();
            _focusNodes[index - 1].requestFocus();
          }
        },
        focusNode: _focusNodes[index],
        controller: _controllers[index],
        style: const TextStyle(
          fontSize: AppFontSize.s18,
        ),
      ),
    );
  }

  void resendCode() {}

  void sendCode(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/reset-password');
  }
}
