import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safe_chat/app_style/manager/font_manager.dart';
import 'package:safe_chat/locator/di.dart';
import 'package:safe_chat/utilities/widgets/app_button.dart';
import 'package:safe_chat/utilities/widgets/app_input_field.dart';
import 'package:safe_chat/utilities/widgets/app_text.dart';
import 'package:safe_chat/view_models/feeds/feeds_view_model.dart';
import 'package:safe_chat/views/create_profile/create_profile_view.dart';
import 'package:safe_chat/views/feeds/widget/app_bar.dart';
import 'package:safe_chat/views/feeds/widget/button_text.dart';
import 'package:safe_chat/views/feeds/widget/post_fields.dart';
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
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 250.h,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: viewModel.users.length,
                      itemBuilder: (context, index) {
                        final user = viewModel.users[index];
                        return ListTile(
                          title: Row(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      navigationService.push(const CreateProfileView(selectedGender: "selectedGender"));
                                    },
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage(user.image),
                                        ),
                                        AppText(
                                          user.name,
                                        ),
                                      ],
                                    ),

                                  ),
                                  SizedBox(width: 10.h),
                                  AppText('${user.datePosted} ${user.timePosted}', fontSize: AppFontSize.s12, color: AppColors.grey),
                                ],
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4.h),
                              // AppText(user.userPost),
                              GestureDetector(
                                onTap: () {
                                  // Handle comments tap
                                  viewModel.showComments(index);
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.thumb_up),
                                    SizedBox(width: 4.w),
                                    AppText('${user.impressionsCount} impressions'),
                                    SizedBox(width: 20.w),
                                    const Icon(Icons.comment),
                                    SizedBox(width: 4.w),
                                    AppText('${user.commentsCount} comments'),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              if (user.comments.isNotEmpty && viewModel.shouldShowComments(index))
                                ...user.comments.map((comment) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.comment),
                                            SizedBox(width: 4.w),
                                            Text('${comment.commenter}: ${comment.comment}'),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                    ],
                                  );
                                }).toList(),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}