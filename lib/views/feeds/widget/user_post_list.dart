import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_style/manager/font_manager.dart';
import '../../../app_style/manager/theme_manager.dart';
import '../../../utilities/widgets/app_text.dart';
import '../../../view_models/feeds/feeds_view_model.dart';

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
            return Padding(
              padding: const EdgeInsets.only(right: 8, left: 8, bottom: 10),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: .5,
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: ListTile(
                  title: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(user.image),
                            ),
                            SizedBox(width: 5.w),
                            AppText(
                              user.name,
                              fontSize: AppFontSize.s14.sp,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: AppText(
                          '${user.datePosted} ${user.timePosted}',
                          fontSize: AppFontSize.s12,
                          color: AppColors.grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.more_horiz, size: AppFontSize.s20),
                    ],
                  ),
                  subtitle: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 55),
                        child: AppText(
                          user.postContent,
                          fontSize: AppFontSize.s16,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          const Icon(Icons.thumb_up, size: AppFontSize.s20),
                          SizedBox(width: 5.w),
                          AppText('${user.impressionsCount}'),
                          const Spacer(),
                          const Icon(Icons.comment_sharp, size: AppFontSize.s20),
                          SizedBox(width: 5.w),
                          AppText('${user.commentsCount}'),
                          const Spacer(),
                          const Icon(Icons.graphic_eq, size: AppFontSize.s20),
                          SizedBox(width: 5.w),
                          AppText('${user.commentsCount}'),
                          const Spacer(),
                          const Icon(Icons.share, size: AppFontSize.s20),
                          SizedBox(width: 5.w),
                          AppText('${user.commentsCount}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}