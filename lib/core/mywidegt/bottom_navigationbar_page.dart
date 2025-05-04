// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/features/home/presentation/pages/home_page.dart';
import 'package:two_mobile/features/home/presentation/widgets/customiconchange.dart';
import 'package:two_mobile/features/inbox/presentation/pages/inbox_page.dart';
import 'package:two_mobile/features/profile/presentation/pages/profile_page.dart';
import 'package:two_mobile/features/projects/presentation/pages/projects_page.dart';

class BottomNavigationbarPage extends StatefulWidget {
  const BottomNavigationbarPage({super.key});

  @override
  State<BottomNavigationbarPage> createState() =>
      _BottomNavigationbarPageState();
}

class _BottomNavigationbarPageState extends State<BottomNavigationbarPage> {
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
    ProfilePage(),
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
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment_rounded), label: 'projects'),
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
                icon: Icon(Icons.message_outlined), label: 'inbox'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          ]),
    );
  }
}
