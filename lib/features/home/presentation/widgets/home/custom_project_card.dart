import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/projects/data/model/project_model.dart';

class CustomProjectCard extends StatelessWidget {
  const CustomProjectCard({required this.projectModel, super.key});
  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(AppRouteConfig.projectDetailes,
          extra: projectModel),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 260,
          width: 400,
          child: Card(
            elevation: 8,
            shadowColor: AppColors.fontLightColor.withOpacity(0.4),
            color: AppColors.cardColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    SizedBox(
                        height: 140,
                        width: 400,
                        child:
                            Image.asset('assets/images/png/Rectangle 2.png')),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Container(
                        width: 100,
                        height: 32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.cardColor.withOpacity(0.4)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              projectModel.duration,
                              style: AppTextStyle.subtitle03(
                                  color: AppColors.cardColor),
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                  Text(
                    projectModel.projectDescription,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  PaddingConfig.h16,
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Icon(
                          Iconsax.user_square,
                          color: AppColors.fontLightColor,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'created by :',
                        style: AppTextStyle.subtitle02(
                            color: AppColors.fontLightColor),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        projectModel.fullName,
                        style: AppTextStyle.subtitle02(),
                      ),
                      const SizedBox(width: 37),
                      Text(
                        projectModel.status,
                        style: AppTextStyle.subtitle03(
                            color: AppColors.fontLightColor),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
