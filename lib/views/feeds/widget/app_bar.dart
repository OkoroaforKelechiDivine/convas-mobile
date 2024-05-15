import 'package:flutter/material.dart';
import 'package:safe_chat/app_style/manager/font_manager.dart';
import 'package:safe_chat/utilities/widgets/app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.person_rounded),
          onPressed: () {},
        ),
        const Spacer(),
        const AppText(
          "SafeChat",
          fontSize: AppFontSize.s22,
          fontWeight: AppFontWeight.bold,
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.telegram),
          onPressed: () {},
        ),
      ],
    );
  }
}