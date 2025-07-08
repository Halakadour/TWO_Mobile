import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/features/home/presentation/widgets/custom_text_field_for_home.dart';

class TeamNameTextField extends StatelessWidget {
  const TeamNameTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFieldForHome(
      height: 55,
      width: 340,
      bordercolor: AppColors.fieldfield,
      textfield: AppColors.blackColor,
      color: AppColors.fieldfield,
      prefix: Iconsax.document_text,
      suffix: null,
      text: 'Team Name',
      textcolor: AppColors.fontLightColor,
      iconcolor: AppColors.fontLightColor,
      controller: controller,
      validator: (p0) => p0 != null ? null : 'This field is requarid',
    );
  }
}
