import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safe_chat/views/welcome/widget/intro_content.dart';
import 'package:safe_chat/theme_settings/manager/font_manager.dart';
import 'package:stacked/stacked.dart';

import '../../assets_global/exports.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_text.dart';
import '../../theme_settings/manager/theme_manager.dart';
import '../../view_models/welcome/welcome_view_model.dart';
import 'widget/image_with_title_and_content.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeViewModel>.reactive(
      viewModelBuilder: () => WelcomeViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Expanded(
                  child: CarouselSlider(
                    items: model.imageData.map((data) => ImageWithTitleAndContent(
                      image: data['image']!,
                      title: data['title']!,
                      content: data['text']!,
                    )).toList(),
                    options: CarouselOptions(
                      height: 700.h,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 8),
                      autoPlayAnimationDuration:
                      const Duration(seconds: 2),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                      enableInfiniteScroll: true,
                      viewportFraction: 1,
                      onPageChanged: (index, _) {
                        model.setCarouselIndex(index);
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(
                          model.imageData.length, (index) => Container(
                          width: 10.w,
                          height: 10.w,
                          margin:
                          const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == model.currentCarouselIndex ? AppColors.blackColor : AppColors.white,
                            border: index != model.currentCarouselIndex ? Border.all(color: AppColors.blackColor) : null,
                          ),
                        ),
                        ),
                      ),
                      AppButton(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        onPressed: () {},
                        title: 'Next',
                        width: 150.w,
                        height: 35.h,
                        radius: 100.r,
                        color: AppColors.blackColor,
                        child: AppText(
                          model.currentCarouselIndex == model.imageData.length - 1 ? 'Create Account' : 'Skip',
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
