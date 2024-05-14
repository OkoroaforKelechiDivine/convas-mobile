import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safe_chat/app_style/manager/font_manager.dart';
import 'package:safe_chat/utilities/widgets/app_button.dart';
import 'package:safe_chat/utilities/widgets/app_input_field.dart';
import 'package:safe_chat/utilities/widgets/app_text.dart';
import 'package:safe_chat/view_models/feeds/feeds_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../app_style/manager/theme_manager.dart';

class FeedsView extends StatelessWidget {
  const FeedsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedsViewModel>.reactive(
      viewModelBuilder: () => FeedsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
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
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        viewModel.selectWhatIsOnYourMind();
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all<Color>(
                          viewModel.isWhatIsOnYourMindButtonSelected ? AppColors.transparent : AppColors.black.withOpacity(0.1),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 4),
                        decoration: viewModel.isWhatIsOnYourMindButtonSelected ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 2,
                                color: AppColors.black
                            ),
                          ),
                        )
                            : null,
                        child: const AppText(
                          "What's on your mind?",
                          fontWeight: AppFontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        viewModel.selectWhileYouWereAway();
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all<Color>(
                          viewModel.isWhatIsOnYourMindButtonSelected ? AppColors.black.withOpacity(0.1) : AppColors.transparent,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 4),
                        decoration: viewModel.isWhatIsOnYourMindButtonSelected ? null : const BoxDecoration(
                          border: Border(bottom: BorderSide(
                              width: 2,
                              color: Colors.black
                          ),
                          ),
                        ),
                        child: const AppText(
                          "While you were away..",
                          fontWeight: AppFontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: AppInputField(
                    onChanged: (text) => viewModel.inputText = text,
                    hintText: "Express yourself",
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 100.w,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: AppButton(
                        onPressed: () {},
                        buttonText: 'Share',
                        height: 10.h,
                        radius: 8,
                        width: 10.w,
                      ),
                    ),
                  ),
                ),
                const Divider(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }
}