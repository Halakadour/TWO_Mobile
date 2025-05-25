// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/paths/assets_path.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/features/auth/role/data/models/role_model.dart';
import 'package:two_mobile/features/home/presentation/widgets/textfield.dart';

class ClientProfileForm extends StatefulWidget {
  const ClientProfileForm({super.key});

  @override
  State<ClientProfileForm> createState() => _ClientProfileFormState();
}

class _ClientProfileFormState extends State<ClientProfileForm> {
  RoleModel? roleModel;
  String? imagebase64;
  File? image;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: (image == null)
                          ? const AssetImage(ImagesPath.profile)
                          : FileImage(image!))),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.maingreen,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: AppColors.cardColor,
                    ),
                  ),
                )),
          ],
        ),
        PaddingConfig.h64,
        TextFieldPage(
          height: 60,
          width: 340,
          Bordercolor: AppColors.fieldfield,
          textfield: AppColors.blackColor,
          color: AppColors.fieldfield,
          prefix: Icons.business_center_rounded,
          suffix: Icons.keyboard_arrow_down_rounded,
          text: 'Role',
          textcolor: AppColors.fontLightColor,
          iconcolor: AppColors.iconColor,
          bordercolor: AppColors.fieldfield,
        ),
        PaddingConfig.h250,
        GradientOutlineButton(
          onpressed: () {
            context.pushReplacementNamed(AppRouteConfig.main);
          },
          text: 'continue',
          textColor: AppColors.cardColor,
          buttonColor: AppColors.buttonColor,
        )
      ],
    );
  }
}
