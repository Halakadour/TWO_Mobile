// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/home/presentation/widgets/textbutton.dart';
import 'package:two_mobile/features/home/presentation/widgets/textfield.dart';

class CustomHomeHeader extends StatelessWidget {
  const CustomHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          child: Padding(
            padding: PaddingConfig.pagePadding,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/png/steve.png'),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, Steve',
                                style: AppTextStyle.subtitle01(
                                    color: AppColors.whiteColor),
                              ),
                              Text(
                                'Let’s work casually',
                                style: AppTextStyle.subtitle02(
                                    color: AppColors.fontLightColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 110),
                      child: Icon(
                        Iconsax.notification_bing4,
                        color: AppColors.cardColor,
                        size: 25,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                TextFieldPage(
                  height: 55,
                  width: 340,
                  bordercolor2: AppColors.iconColor,
                  textfield: AppColors.cardColor,
                  text: 'Search your task',
                  color: AppColors.navColor,
                  prefix: Iconsax.search_normal_1,
                  suffix: Iconsax.menu,
                  textcolor: AppColors.iconColor,
                  iconcolor: AppColors.iconColor,
                  bordercolor: AppColors.iconColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent project',
                      style: AppTextStyle.heading04(color: AppColors.cardColor),
                    ),
                    TextButtonPage(onpressed: () {
                      context.pushNamed(AppRouteConfig.recentproject);
                    })
                  ],
                )
              ],
            ),
          ),
          color: AppColors.navColor,
        ));
  }
}
