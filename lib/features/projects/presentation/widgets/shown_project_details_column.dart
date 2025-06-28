import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/projects/data/model/project_model.dart';
import 'package:two_mobile/features/projects/presentation/widgets/custom_image_circle.dart';

class ShownProjectDetailsColumn extends StatelessWidget {
  const ShownProjectDetailsColumn({super.key, required this.projectModel});
  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    final manangerList = projectModel.team?.members.where(
      (element) => element.isManager == true,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              projectModel.team?.name ?? "No Team",
              style: AppTextStyle.subtitle03(color: AppColors.iconColor),
            ),
            // ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemCount: projectModel.team?.members.length ?? 0,
            //   itemBuilder: (context, index) => CustomNetworkImageCircle(
            //       // It has to return an image
            //       imageUri: projectModel.team?.members[index].name),
            // ),
            PaddingConfig.w8,
            const Icon(
              Iconsax.add_square,
              size: 20,
            )
          ],
        ),
        PaddingConfig.h16,
        Row(
          children: [
            const CustomImageCircle(
              imagePath: 'assets/images/png/steve.png',
            ),
            PaddingConfig.w8,
            Text(
              manangerList?.first.name ?? "No Manager",
              style: AppTextStyle.subtitle03(color: AppColors.iconColor),
            )
          ],
        ),
        PaddingConfig.h16,
        Row(
          children: [
            const CustomImageCircle(
              imagePath: 'assets/images/png/profile 2.png',
            ),
            PaddingConfig.w8,
            Text(
              projectModel.fullName,
              style: AppTextStyle.subtitle03(color: AppColors.iconColor),
            )
          ],
        ),
        PaddingConfig.h16,
        Container(
          height: 25,
          width: 100,
          decoration: BoxDecoration(
              color: AppColors.mainblue.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                projectModel.status,
                style: AppTextStyle.subtitle04(color: AppColors.mainblue),
              ),
              PaddingConfig.w4,
              const Icon(
                Iconsax.arrow_down_1,
                color: AppColors.mainblue,
                size: 16,
              )
            ],
          ),
        ),
        PaddingConfig.h16,
        Row(
          children: [
            Text(
              projectModel.duration,
              style: AppTextStyle.subtitle02(color: AppColors.iconColor),
            ),
            PaddingConfig.w8,
            const Icon(
              Iconsax.edit_24,
              color: AppColors.mainblue,
              size: 18,
            )
          ],
        ),
        PaddingConfig.h16,
        Text(
          projectModel.private == 0 ? "Private" : "Public",
          style: AppTextStyle.subtitle02(color: AppColors.iconColor),
        ),
        PaddingConfig.h16,
        Row(
          children: [
            Container(
              height: 25,
              width: 100,
              decoration: BoxDecoration(
                  color: AppColors.mainblue.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Iconsax.document_text_1,
                    color: AppColors.mainblue,
                    size: 15,
                  ),
                  PaddingConfig.w4,
                  Text(
                    projectModel.contract ?? "No Contract",
                    style: AppTextStyle.subtitle04(color: AppColors.mainblue),
                  ),
                ],
              ),
            ),
            PaddingConfig.w8,
            Container(
              height: 25,
              width: 70,
              decoration: BoxDecoration(
                  color: AppColors.mainblue,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  PaddingConfig.w8,
                  Text(
                    'Change',
                    style: AppTextStyle.subtitle04(color: AppColors.cardColor),
                  ),
                  PaddingConfig.w8,
                  const Icon(
                    Iconsax.edit_24,
                    color: AppColors.cardColor,
                    size: 12,
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
