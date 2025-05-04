// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/mywidegt/bottom_navigationbar_page.dart';
import 'package:two_mobile/features/home/presentation/widgets/customalterdialog2.dart';
import 'package:two_mobile/features/home/presentation/widgets/customcontainer.dart';
import 'package:two_mobile/features/home/presentation/widgets/customcountainercard.dart';
import 'package:two_mobile/features/home/presentation/widgets/customiconback.dart';

class RecentprojectPage extends StatelessWidget {
  const RecentprojectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.cardColor,
        body: Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: ListView(
              children: [
                Customiconback(
                    Onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigationbarPage()));
                    },
                    text: 'Recent Projects'),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomAlterDialog2(),
                      SizedBox(width: 10),
                      customContainer(
                          containercolor: AppColors.navyColor,
                          textcolor: AppColors.cardColor,
                          text: 'New project',
                          iconcolor: AppColors.cardColor,
                          icon: Icons.add),
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
                  Titletext:
                      'Building flutter app for math and physics kids\nlearning',
                  containertext: '3 days left',
                  image: 'assets/images/png/Rectangle 1.png',
                ),
                CustomContainerCard(
                  Datetext: 'Dec 24-2024',
                  Nametext: 'Hala Kadour',
                  Titletext:
                      'Building flutter app for math and physics kids\nlearning',
                  containertext: '5 days left',
                  image: 'assets/images/png/Rectangle 2.png',
                )
              ],
            )));
  }
}
