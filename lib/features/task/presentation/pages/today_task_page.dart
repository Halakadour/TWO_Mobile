// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/widgets/buttons/custom_add_navy_button.dart';
import 'package:two_mobile/features/home/presentation/widgets/filters/task_filter_dialog.dart';
import 'package:two_mobile/features/home/presentation/widgets/custom_back_icon_with_text.dart';
import 'package:two_mobile/features/task/presentation/widgets/today_task_item.dart';

class TodayTaskPage extends StatelessWidget {
  const TodayTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: PaddingConfig.pagePadding,
        child: Column(
          children: [
            CustomBackIconWithText(text: 'Today tasks'),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TaskFilterDialog(),
                  CustomAddNavyButton(
                      text: "New Task",
                      onTap: () =>
                          context.pushNamed(AppRouteConfig.addNewTask)),
                  CustomAddNavyButton(
                    text: "View On Calendar",
                    onTap: () => context.pushNamed(AppRouteConfig.calendar),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                context.pushReplacementNamed(AppRouteConfig.taskDetatialsPage);
              },
              child: TodayTaskItem(
                textcolor: AppColors.mainblue,
                title: 'create leading page',
                priority: 'Low',
                time: '10: 00 am - 10: 30 am',
                status: 'completed',
                priopritycolor: AppColors.mainblue,
                statuscolor: AppColors.mainColor,
                iconcolor: AppColors.mainblue,
              ),
            ),
            TodayTaskItem(
              textcolor: AppColors.mainyallow,
              title: ' design wireframe kit',
              priority: 'Medium',
              time: '11: 00 am - 12: 00 am',
              status: 'canceled',
              priopritycolor: AppColors.mainyallow,
              statuscolor: AppColors.redColor,
              iconcolor: AppColors.mainyallow,
            ),
            TodayTaskItem(
              textcolor: AppColors.redColor,
              title: 'team meeting',
              priority: 'High',
              time: '02: 00 pm - 04: 50 pm',
              status: 'in progress',
              priopritycolor: AppColors.redColor,
              statuscolor: AppColors.mainblue,
              iconcolor: AppColors.redColor,
            ),
            TodayTaskItem(
              textcolor: AppColors.mainyallow,
              title: 'coding the home page',
              priority: 'Medium',
              time: '10: 00 am - 10: 30 am',
              status: 'pending',
              priopritycolor: AppColors.mainyallow,
              statuscolor: AppColors.mainyallow,
              iconcolor: AppColors.mainyallow,
            ),
            TodayTaskItem(
              textcolor: AppColors.mainblue,
              title: 'create leading page',
              priority: 'Low',
              time: '10: 00 am - 10: 30 am',
              status: 'completed',
              priopritycolor: AppColors.mainblue,
              statuscolor: AppColors.mainColor,
              iconcolor: AppColors.mainblue,
            ),
            TodayTaskItem(
              textcolor: AppColors.mainyallow,
              title: ' design wireframe kit',
              priority: 'Medium',
              time: '11: 00 am - 12: 00 am',
              status: 'canceled',
              priopritycolor: AppColors.mainyallow,
              statuscolor: AppColors.redColor,
              iconcolor: AppColors.mainyallow,
            ),
            TodayTaskItem(
              textcolor: AppColors.redColor,
              title: 'team meeting',
              priority: 'High',
              time: '02: 00 pm - 04: 50 pm',
              status: 'in progress',
              priopritycolor: AppColors.redColor,
              statuscolor: AppColors.mainblue,
              iconcolor: AppColors.redColor,
            ),
            TodayTaskItem(
              textcolor: AppColors.mainyallow,
              title: ' design wireframe kit',
              priority: 'Medium',
              time: '11: 00 am - 12: 00 am',
              status: 'in progress',
              priopritycolor: AppColors.mainyallow,
              statuscolor: AppColors.mainblue,
              iconcolor: AppColors.mainyallow,
            ),
          ],
        ),
      ),
    );
  }
}
