import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safe_chat/view_models/feeds/feeds_view_model.dart';
import 'package:safe_chat/views/feeds/widget/app_bar.dart';
import 'package:safe_chat/views/feeds/widget/button_text.dart';
import 'package:safe_chat/views/feeds/widget/post_fields.dart';
import 'package:safe_chat/views/feeds/widget/user_post_list.dart';
import 'package:stacked/stacked.dart';

import '../../app_style/manager/theme_manager.dart';

class FeedsView extends StatelessWidget {
  const FeedsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => FeedsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: const CustomAppBar(),
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
                        ) : null,
                        child: CustomButtonText(
                          text: "What's on your mind?",
                          color: AppColors.black,
                          isSelected: viewModel.isWhatIsOnYourMindButtonSelected,
                          onPressed: () {
                            viewModel.selectWhatIsOnYourMind();
                          },
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
                        decoration: viewModel.isWhatIsOnYourMindButtonSelected ? null : BoxDecoration(
                          border: Border(bottom: BorderSide(
                              width: 2,
                              color: AppColors.black
                          ),
                          ),
                        ),
                        child: CustomButtonText(
                          text: "While you were away..",
                          color: AppColors.black,
                          isSelected: !viewModel.isWhatIsOnYourMindButtonSelected,
                          onPressed: () {
                            viewModel.selectWhileYouWereAway();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                PostInputFields(
                  hintText: "Express yourself",
                  onChanged: (text) => viewModel.inputText = text,
                  onSharePressed: () {},
                ),
                SizedBox(height: 20.h),
                UserPostList(viewModel: viewModel),
              ],
            ),
          ),
        );
      },
    );
  }
}