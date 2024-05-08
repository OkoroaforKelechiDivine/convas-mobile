import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme_settings/manager/font_manager.dart';
import '../../../theme_settings/manager/theme_manager.dart';

class ImageWithTitleAndContent extends StatelessWidget {
  final String image;
  final String title;
  final String content;

  const ImageWithTitleAndContent({
    Key? key,
    required this.image,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: MediaQuery.of(context).size.width,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: AppFontWeight.bold,
                  color: AppColors.blackColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 3.h),
              Text(
                content,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: AppColors.blackColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}