import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safe_chat/utilities/widgets/app_button.dart';
import 'package:stacked/stacked.dart';

import '../../app_style/manager/theme_manager.dart';
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
                      SizedBox(
                        width: 150.w,
                        child: CustomElevatedButton(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          onPressed: () {
                            if (model.currentCarouselIndex == model.imageData.length - 1) {
                              model.navigateToCreateAccount(context);
                            } else {
                              model.setCarouselIndex(model.currentCarouselIndex + 1);
                            }
                          },
                          buttonText: model.currentCarouselIndex == model.imageData.length - 1 ? 'Create Account' : 'Skip',
                          radius: 100.r,
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