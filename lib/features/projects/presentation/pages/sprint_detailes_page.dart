// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/projects/presentation/pages/add_sprint_page.dart';
import 'package:two_mobile/features/projects/presentation/widgets/custom_gesture_detector.dart';
import 'package:two_mobile/features/projects/presentation/widgets/custom_sprint_details_column.dart';
import 'package:two_mobile/features/projects/presentation/widgets/shown_sprint_details_column.dart';
import 'package:two_mobile/features/projects/presentation/widgets/custom_icon_with_text.dart';
import 'package:two_mobile/features/projects/presentation/widgets/custom_task_tab_bar.dart';

class SprintDetailesPage extends StatelessWidget {
  const SprintDetailesPage({super.key});
  final double _ProgressValue = 0.63;

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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddSprintPage()));
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
            'Sprint Details',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ERD Design',
              style: AppTextStyle.heading04(),
            ),
            PaddingConfig.h8,
            Text(
              'designing the data base system by using\nrelational tables sql.',
              style: AppTextStyle.subtitle01(color: AppColors.fontLightColor),
            ),
            PaddingConfig.h24,
            Row(
              children: [
                CustomSprintDetailsColumn(),
                PaddingConfig.w24,
                ShownSprintDetailsColumn(),
              ],
            ),
            PaddingConfig.h24,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pushNamed(AppRouteConfig.meeting);
                  },
                  child: CustomGestureDetector(
                      icon: Iconsax.video,
                      text: 'Meetings',
                      containercolor: AppColors.Lightblue,
                      color: AppColors.Darkblue),
                ),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(AppRouteConfig.payementHistory);
                  },
                  child: CustomGestureDetector(
                      icon: Iconsax.wallet_2,
                      text: 'Payments',
                      containercolor: AppColors.Lightgreencolor,
                      color: AppColors.Darkgreen),
                ),
              ],
            ),
            PaddingConfig.h8,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Progress',
                    style: AppTextStyle.subtitle03(
                        color: AppColors.fontLightColor),
                  ),
                  Text(
                    '${(_ProgressValue * 100).toStringAsFixed(0)}%',
                    style: AppTextStyle.subtitle03(),
                  )
                ],
              ),
            ),
            LinearProgressIndicator(
              borderRadius: BorderRadius.circular(20),
              value: _ProgressValue,
              minHeight: 8,
              backgroundColor: AppColors.fontLightColor.withOpacity(0.5),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.greenColor),
            ),
            PaddingConfig.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Task (14)',
                  style: AppTextStyle.heading04(),
                ),
                Icon(Iconsax.add_square)
              ],
            ),
            PaddingConfig.h8,
            CustomTaskTabBar(),
          ],
        ),
      ),
    );
  }
}
