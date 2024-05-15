import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safe_chat/utilities/widgets/app_divider.dart';

import '../../../app_style/manager/font_manager.dart';
import '../../../app_style/manager/theme_manager.dart';
import '../../../locator/locator.dart';
import '../../../utilities/widgets/app_text.dart';
import '../../../view_models/feeds/feeds_view_model.dart';
import '../../create_profile/create_profile_view.dart';

class UserPostList extends StatelessWidget {
  final FeedsViewModel viewModel;

  const UserPostList({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      SizedBox(width: 5.h),
                      AppText('${user.datePosted} ${user.timePosted}', fontSize: AppFontSize.s12, color: AppColors.grey),
                    ],
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    user.postContent,
                    fontSize: AppFontSize.s16,
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      viewModel.showComments(index);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.thumb_up, size: AppFontSize.s20),
                        SizedBox(width: 4.w),
                        AppText('${user.impressionsCount} likes'),
                        SizedBox(width: 15.w),
                        const Icon(Icons.comment_sharp, size: AppFontSize.s20),
                        SizedBox(width: 4.w),
                        AppText('${user.commentsCount} comments'),
                        const Icon(Icons.comment_sharp, size: AppFontSize.s20),
                        SizedBox(width: 4.w),
                        AppText('${user.commentsCount} comments'),
                        // SizedBox(width: 4.w),
                        // const Icon(Icons.comment_sharp, size: AppFontSize.s20),
                        // SizedBox(width: 4.w),
                        // const Icon(Icons.comment_sharp, size: AppFontSize.s20),
                        const AppDivider(),
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
    );
  }
}
