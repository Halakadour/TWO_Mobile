// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/home/presentation/widgets/customcountainercard.dart';
import 'package:two_mobile/features/home/presentation/widgets/textfield.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  child: Padding(
                    padding: PaddingConfig.pagePadding,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, bottom: 30),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/png/logo.png',
                                height: 20,
                              ),
                              PaddingConfig.w8,
                              Text(
                                'My Projects',
                                style: AppTextStyle.heading03(
                                    color: AppColors.cardColor),
                              )
                            ],
                          ),
                        ),
                        TextFieldPage(
                          height: 60,
                          width: 340,
                          Bordercolor: AppColors.iconColor,
                          textfield: AppColors.cardColor,
                          text: 'Search your task',
                          color: AppColors.navColor,
                          prefix: Iconsax.search_normal_1,
                          suffix: Iconsax.menu,
                          textcolor: AppColors.iconColor,
                          iconcolor: AppColors.iconColor,
                          bordercolor: AppColors.iconColor,
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.navColor,
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                  ),
                )),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 170, right: 20, left: 20),
          child: ListView(
            children: [
              CustomContainerCard(
                Datetext: 'Dec 20-2024',
                Nametext: 'Hala Kadour',
                Titletext: 'Building meat & milk shop ecommerce website',
                containertext: '2 days left',
                image: 'assets/images/png/Rectangle.png',
              ),
              CustomContainerCard(
                Datetext: 'Dec 22-2024',
                Nametext: 'Hala Kadour',
                Titletext: 'Building flutter app for math and physics kids',
                containertext: '3 days left',
                image: 'assets/images/png/Rectangle 1.png',
              ),
              CustomContainerCard(
                Datetext: 'Dec 24-2024',
                Nametext: 'Hala Kadour',
                Titletext: 'Building flutter app for math and physics kids',
                containertext: '5 days left',
                image: 'assets/images/png/Rectangle 2.png',
              )
            ],
          ),
        )
      ],
    ));
  }
}
