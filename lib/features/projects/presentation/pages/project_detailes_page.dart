import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/projects/data/model/project_model.dart';
import 'package:two_mobile/features/projects/presentation/pages/add_sprint_page.dart';
import 'package:two_mobile/features/projects/presentation/widgets/custom_project_details_column.dart';
import 'package:two_mobile/features/projects/presentation/widgets/custom_sprint_column.dart';
import 'package:two_mobile/features/projects/presentation/widgets/shown_project_details_column.dart';
import 'package:two_mobile/features/projects/presentation/widgets/custom_icon_with_text.dart';

class ProjectDetailesPage extends StatelessWidget {
  const ProjectDetailesPage({super.key, required this.projectModel});
  final ProjectModel projectModel;

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
              onPressed: () => context.pop(),
              icon: const Icon(
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
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          topLeft: Radius.circular(12))),
                  position: PopupMenuPosition.under,
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: CustomIconWithText(
                        color: AppColors.blackColor,
                        icon: Iconsax.gallery,
                        text: 'Change Cover',
                      ),
                    ),
                    const PopupMenuItem(
                      child: CustomIconWithText(
                        color: AppColors.blackColor,
                        icon: Iconsax.magicpen,
                        text: 'Edit Project',
                      ),
                    ),
                    const PopupMenuItem(
                      child: CustomIconWithText(
                        color: AppColors.redColor,
                        icon: Iconsax.trash,
                        text: 'Delete Project',
                      ),
                    )
                  ],
                  child: const Icon(
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
                    projectModel.projectType,
                    style: AppTextStyle.subtitle01(color: AppColors.mainblue),
                  ),
                  PaddingConfig.h16,
                  Text(
                    projectModel.projectDescription,
                    style: AppTextStyle.subtitle01(),
                  ),
                  PaddingConfig.h24,
                  Row(
                    children: [
                      const CustomProjectDetailsColumn(),
                      PaddingConfig.w16,
                      ShownProjectDetailsColumn(
                        projectModel: projectModel,
                      )
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
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const CustomSprintColumn(
                                    color: AppColors.mainyallow,
                                    number: '4',
                                    text: 'To-Do',
                                  ),
                                  PaddingConfig.w16,
                                  const CustomSprintColumn(
                                      color: AppColors.mainblue,
                                      number: '2',
                                      text: 'In-Progress'),
                                  PaddingConfig.w16,
                                  const CustomSprintColumn(
                                      color: AppColors.mainColor,
                                      number: '5',
                                      text: 'Complete'),
                                  PaddingConfig.w16,
                                  const CustomSprintColumn(
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
                            shape: const CircleBorder(),
                            child: const Icon(
                              Iconsax.add,
                              color: AppColors.cardColor,
                              size: 35,
                            ),
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
