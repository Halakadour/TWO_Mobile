// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/features/home/presentation/pages/home_page.dart';
import 'package:two_mobile/features/home/presentation/widgets/customiconchange.dart';
import 'package:two_mobile/features/inbox/presentation/pages/inbox_page.dart';
import 'package:two_mobile/features/profile/presentation/pages/profile_page.dart';

import 'package:two_mobile/features/projects/presentation/pages/projects_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isIconChange = false;

  void _toggleIcon() {
    setState(() {
      isIconChange = !isIconChange;
    });
  }

  int myCurrentIndex = 0;
  List pages = [
    const HomePage(),
    const ProjectsPage(),
    const HomePage(),
    const InBoxPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[myCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 26,
          currentIndex: myCurrentIndex,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: AppColors.rockLightColor,
          onTap: (index) {
            setState(() {
              myCurrentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Iconsax.home_25), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.document_text5), label: 'projects'),
            BottomNavigationBarItem(
                icon: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.from(
                          alpha: 1, red: 0.396, green: 0.835, blue: 0.247),
                      borderRadius: BorderRadius.circular(25)),
                  child: CustomIconChange(),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.messages_15), label: 'inbox'),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.profile_circle5), label: 'profile'),
          ]),
    );
  }
}
