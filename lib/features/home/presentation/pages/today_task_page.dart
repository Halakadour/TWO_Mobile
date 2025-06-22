// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/widgets/bottom_navigation_bar_page.dart';
import 'package:two_mobile/features/home/presentation/pages/add_new_task_page.dart';
import 'package:two_mobile/features/home/presentation/pages/calender_page.dart';
import 'package:two_mobile/features/home/presentation/widgets/customcontainer.dart';
import 'package:two_mobile/features/home/presentation/widgets/customdialog.dart';
import 'package:two_mobile/features/home/presentation/widgets/customiconback.dart';
import 'package:two_mobile/features/home/presentation/widgets/taskitem.dart';

class TodayTaskPage extends StatelessWidget {
  const TodayTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: PaddingConfig.pagePadding,
        child: Column(
          children: [
            Customiconback(
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPage()));
                },
                text: 'Today tasks'),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomAlterDialog(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddNewTaskPage()));
                    },
                    child: customContainer(
                        containercolor: AppColors.navyColor,
                        textcolor: AppColors.cardColor,
                        text: 'New Task',
                        iconcolor: AppColors.cardColor,
                        icon: Icons.add),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CalenderPage()));
                    },
                    child: customContainer(
                        containercolor: AppColors.navyColor,
                        textcolor: AppColors.cardColor,
                        text: 'View on Calendar',
                        iconcolor: AppColors.cardColor,
                        icon: Iconsax.calendar_edit),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                context.pushReplacementNamed(AppRouteConfig.taskDetatialsPage);
              },
              child: TodayTask(
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
            TodayTask(
              textcolor: AppColors.mainyallow,
              title: ' design wireframe kit',
              priority: 'Medium',
              time: '11: 00 am - 12: 00 am',
              status: 'canceled',
              priopritycolor: AppColors.mainyallow,
              statuscolor: AppColors.redColor,
              iconcolor: AppColors.mainyallow,
            ),
            TodayTask(
              textcolor: AppColors.redColor,
              title: 'team meeting',
              priority: 'High',
              time: '02: 00 pm - 04: 50 pm',
              status: 'in progress',
              priopritycolor: AppColors.redColor,
              statuscolor: AppColors.mainblue,
              iconcolor: AppColors.redColor,
            ),
            TodayTask(
              textcolor: AppColors.mainyallow,
              title: 'coding the home page',
              priority: 'Medium',
              time: '10: 00 am - 10: 30 am',
              status: 'pending',
              priopritycolor: AppColors.mainyallow,
              statuscolor: AppColors.mainyallow,
              iconcolor: AppColors.mainyallow,
            ),
            TodayTask(
              textcolor: AppColors.mainblue,
              title: 'create leading page',
              priority: 'Low',
              time: '10: 00 am - 10: 30 am',
              status: 'completed',
              priopritycolor: AppColors.mainblue,
              statuscolor: AppColors.mainColor,
              iconcolor: AppColors.mainblue,
            ),
            TodayTask(
              textcolor: AppColors.mainyallow,
              title: ' design wireframe kit',
              priority: 'Medium',
              time: '11: 00 am - 12: 00 am',
              status: 'canceled',
              priopritycolor: AppColors.mainyallow,
              statuscolor: AppColors.redColor,
              iconcolor: AppColors.mainyallow,
            ),
            TodayTask(
              textcolor: AppColors.redColor,
              title: 'team meeting',
              priority: 'High',
              time: '02: 00 pm - 04: 50 pm',
              status: 'in progress',
              priopritycolor: AppColors.redColor,
              statuscolor: AppColors.mainblue,
              iconcolor: AppColors.redColor,
            ),
            TodayTask(
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
