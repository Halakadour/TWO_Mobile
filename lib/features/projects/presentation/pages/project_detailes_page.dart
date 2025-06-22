// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/home/presentation/pages/recent_project_page.dart';
import 'package:two_mobile/features/projects/presentation/pages/add_sprint_page.dart';
import 'package:two_mobile/features/projects/presentation/widgets/customcolumn1.dart';
import 'package:two_mobile/features/projects/presentation/widgets/customcontainer.dart';
import 'package:two_mobile/features/projects/presentation/widgets/customecolumn2.dart';
import 'package:two_mobile/features/projects/presentation/widgets/customicon&text.dart';

class ProjectDetailesPage extends StatelessWidget {
  const ProjectDetailesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/png/cover.png'))),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 0, bottom: 60),
          child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RecentprojectPage()));
              },
              icon: Icon(
                Iconsax.arrow_left,
                size: 30,
                color: AppColors.cardColor,
              )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 60),
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
                      child: Customicon(
                        color: AppColors.blackColor,
                        icon: Iconsax.gallery,
                        text: 'Change Cover',
                      ),
                    ),
                    PopupMenuItem(
                      child: Customicon(
                        color: AppColors.blackColor,
                        icon: Iconsax.magicpen,
                        text: 'Edit Project',
                      ),
                    ),
                    PopupMenuItem(
                      child: Customicon(
                        color: AppColors.redColor,
                        icon: Iconsax.trash,
                        text: 'Delete Project',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: PaddingConfig.pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Building meat & milk shop ecommerce website',
                    style: AppTextStyle.subtitle01(),
                  ),
                  PaddingConfig.h16,
                  Text(
                    'Add Description',
                    style: AppTextStyle.subtitle01(color: AppColors.mainblue),
                  ),
                  PaddingConfig.h24,
                  Row(
                    children: [
                      CustomcolumnPage1(),
                      PaddingConfig.w16,
                      CuustomColoumPage2()
                    ],
                  ),
                  PaddingConfig.h24,
                  Stack(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width,
                          child: Expanded(
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  CustomContainerPage(
                                    color: AppColors.mainyallow,
                                    number: '4',
                                    text: 'To-Do',
                                  ),
                                  PaddingConfig.w16,
                                  CustomContainerPage(
                                      color: AppColors.mainblue,
                                      number: '2',
                                      text: 'In-Progress'),
                                  PaddingConfig.w16,
                                  CustomContainerPage(
                                      color: AppColors.mainColor,
                                      number: '5',
                                      text: 'Complete'),
                                  PaddingConfig.w16,
                                  CustomContainerPage(
                                      color: AppColors.redColor,
                                      number: '2',
                                      text: 'Cancele')
                                ]),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 300),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddSprintPage()));
                            },
                            backgroundColor: AppColors.maingreen,
                            child: Icon(
                              Iconsax.add,
                              color: AppColors.cardColor,
                              size: 35,
                            ),
                            shape: CircleBorder(),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
