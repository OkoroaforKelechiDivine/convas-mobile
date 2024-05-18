import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safe_chat/app_style/manager/font_manager.dart';
import 'package:safe_chat/utilities/widgets/app_button.dart';
import 'package:safe_chat/utilities/widgets/app_divider.dart';
import 'package:safe_chat/utilities/widgets/app_input_field.dart';

class PostInputFields extends StatelessWidget {
  final String hintText;
  final VoidCallback onSharePressed;
  final Function(String) onChanged;

  const PostInputFields({
    required this.hintText,
    required this.onSharePressed,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AppDivider(),
        AppInputField(
          hintText: hintText,
          onChanged: onChanged,
          showBorder: false,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon:  const Icon(Icons.emoji_emotions, size: AppFontSize.s20),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.image, size: AppFontSize.s20),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.keyboard_voice, size: AppFontSize.s20),
            ),
            const Spacer(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: AppButton(
                  onPressed: onSharePressed,
                  buttonText: 'Share',
                  height: 35.h,
                  radius: 100,
                ),
              ),
            ),
          ],
        ),
        const AppDivider(),
      ],
    );
  }
}