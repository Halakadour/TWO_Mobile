// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/widgets/bottom_navigation_bar_page.dart';
import 'package:two_mobile/features/home/presentation/widgets/customalterdialog2.dart';
import 'package:two_mobile/features/home/presentation/widgets/customcontainer.dart';
import 'package:two_mobile/features/home/presentation/widgets/customcountainercard.dart';
import 'package:two_mobile/features/home/presentation/widgets/customiconback.dart';
import 'package:two_mobile/features/home/presentation/widgets/customnewproject.dart';

class RecentprojectPage extends StatelessWidget {
  const RecentprojectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.cardColor,
        body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: ListView(
              children: [
                Customiconback(
                    onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()));
                    },
                    text: 'Recent Projects'),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomAlterDialog2(),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => CustomNewProject());
                        },
                        child: customContainer(
                            containercolor: AppColors.navyColor,
                            textcolor: AppColors.cardColor,
                            text: 'New project',
                            iconcolor: AppColors.cardColor,
                            icon: Icons.add),
                      ),
                    ],
                  ),
                ),
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
            )));
  }
}
