import 'package:flutter/material.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/features/projects/presentation/widgets/custom_task_card.dart';

class CustomTaskTabBar extends StatelessWidget {
  const CustomTaskTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Expanded(
        child: Column(
          children: [
            Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.fieldfield,
              ),
              child: TabBar(
                  unselectedLabelStyle: const TextStyle(fontSize: 12),
                  labelStyle: const TextStyle(fontSize: 14),
                  indicatorSize: TabBarIndicatorSize.tab,
                  padding: const EdgeInsets.all(9),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.cardColor),
                  dividerColor: Colors.transparent,
                  labelColor: AppColors.maingreen,
                  unselectedLabelColor: AppColors.iconColor,
                  tabs: const [
                    Text('all task'),
                    Text('in progress'),
                    Text('completed'),
                    Text('canceled'),
                  ]),
            ),
            PaddingConfig.h8,
            Expanded(
              child: TabBarView(children: [
                ListView(
                  children: const [
                    CustomTaskCard(
                      priority: 'Hight',
                      color1: AppColors.maingreen,
                      color2: AppColors.redColor,
                      text: 'Completed',
                      titletext: 'Create loading page',
                      subtext:
                          'creating a page that will explain the  meaning of the company.',
                      number: '3',
                      image: 'assets/images/png/profile 6.png',
                    ),
                    CustomTaskCard(
                      priority: 'Low',
                      color1: AppColors.redColor,
                      color2: AppColors.mainblue,
                      text: 'Canceled',
                      titletext: 'Wireframe Kit',
                      subtext:
                          'create a page where it shows the employee inform...',
                      number: '5',
                      image: 'assets/images/png/profile 7.png',
                    ),
                    CustomTaskCard(
                      priority: 'Medium',
                      color1: AppColors.mainblue,
                      color2: AppColors.mainyallow,
                      text: 'in progress',
                      titletext: 'Home page',
                      subtext:
                          'create a page where it shows the employee inform...',
                      number: '8',
                      image: 'assets/images/png/profile 6.png',
                    )
                  ],
                ),
                ListView(
                  children: const [
                    CustomTaskCard(
                      priority: 'Medium',
                      color1: AppColors.mainblue,
                      color2: AppColors.mainyallow,
                      text: 'in progress',
                      titletext: 'Home page',
                      subtext:
                          'create a page where it shows the employee inform...',
                      number: '8',
                      image: 'assets/images/png/profile 6.png',
                    ),
                  ],
                ),
                ListView(
                  children: const [
                    CustomTaskCard(
                      priority: 'Hight',
                      color1: AppColors.maingreen,
                      color2: AppColors.redColor,
                      text: 'Completed',
                      titletext: 'Create loading page',
                      subtext:
                          'creating a page that will explain the  meaning of the company.',
                      number: '3',
                      image: 'assets/images/png/profile 6.png',
                    ),
                  ],
                ),
                ListView(
                  children: const [
                    CustomTaskCard(
                      priority: 'Low',
                      color1: AppColors.redColor,
                      color2: AppColors.mainblue,
                      text: 'Canceled',
                      titletext: 'Wireframe Kit',
                      subtext:
                          'create a page where it shows the employee inform...',
                      number: '5',
                      image: 'assets/images/png/profile 7.png',
                    ),
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
