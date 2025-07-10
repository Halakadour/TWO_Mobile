// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/task/presentation/widgets/custom_comment_item.dart';
import 'package:two_mobile/features/task/presentation/widgets/custom_cumment_input.dart';
import 'package:two_mobile/features/projects/presentation/widgets/custom_task_details_column.dart';
import 'package:two_mobile/features/projects/presentation/widgets/shown_task_details_column.dart';
import 'package:two_mobile/features/projects/presentation/widgets/custom_icon_with_text.dart';

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.navColor,
        toolbarHeight: 90,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 20),
          child: IconButton(
              onPressed: () {
                context.pushReplacementNamed(AppRouteConfig.toDayTask);
              },
              icon: Icon(
                Iconsax.arrow_left,
                size: 30,
                color: AppColors.cardColor,
              )),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            'Task Details',
            style: AppTextStyle.heading03(color: AppColors.cardColor),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 20),
            child: IconButton(
                onPressed: () {},
                icon: PopupMenuButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          topLeft: Radius.circular(12))),
                  position: PopupMenuPosition.under,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: CustomIconWithText(
                        color: AppColors.blackColor,
                        icon: Iconsax.magicpen,
                        text: 'Edit Sprint',
                      ),
                    ),
                    PopupMenuItem(
                      child: CustomIconWithText(
                        color: AppColors.redColor,
                        icon: Iconsax.trash,
                        text: 'Delete Sprint',
                      ),
                    )
                  ],
                  child: Icon(
                    Iconsax.more,
                    color: AppColors.cardColor,
                  ),
                )),
          )
        ],
      ),
      body: Padding(
        padding: PaddingConfig.pagePadding,
        child: ListView(
          children: [
            Text(
              'Create loading page',
              style: AppTextStyle.heading04(),
            ),
            PaddingConfig.h8,
            Text(
              'creating a page for users that will explain the\nmeaning of the company..',
              style: AppTextStyle.subtitle02(color: AppColors.fontLightColor),
            ),
            PaddingConfig.h24,
            Row(
              children: [
                CustomTaskDetailsColumn(),
                PaddingConfig.w24,
                ShownTaskDetailsColumn(),
              ],
            ),
            PaddingConfig.h24,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Comments (3)',
                  style: AppTextStyle.heading04(),
                ),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(AppRouteConfig.allCommentsPage);
                  },
                  child: Text(
                    'See All',
                    style: AppTextStyle.subtitle01(color: AppColors.mainColor),
                  ),
                ),
              ],
            ),
            CustomCommentItem(
                name: 'Alia Blue',
                role: 'Flutter-develope',
                comment:
                    'Great work han, I like the loading page design.\nnow please give me a feedback for my tasks too.',
                image: 'assets/images/png/profile 7.png'),
            CustomCommentItem(
                name: 'Harry Potter',
                role: 'UI/UX Designer',
                comment: 'It’s CLEAN design nice work han, keep going.',
                image: 'assets/images/png/image 2.png'),
            CustomCommentItem(
                name: 'Sam Holmes',
                role: 'backend-develope',
                comment:
                    'Wow 💥🤩 Nice work han, The design is full of interesting user expenses actions.',
                image: 'assets/images/png/image 1.png')
          ],
        ),
      ),
      bottomNavigationBar: CustomCummentInput(),
    );
  }
}
