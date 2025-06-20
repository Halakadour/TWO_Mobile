import 'package:flutter/material.dart';
import 'package:two_mobile/config/constants/sizes_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/role/data/models/role_response_model.dart';

class CustomDropdownListForRoleModel extends StatelessWidget {
  const CustomDropdownListForRoleModel({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });
  final RoleModel? value;
  final List<DropdownMenuItem<RoleModel>>? items;
  final void Function(RoleModel?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: SizesConfig.sm,
        horizontal: SizesConfig.md,
      ),
      decoration: BoxDecoration(
          color: AppColors.fieldfield,
          borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd),
          border: Border.all(color: AppColors.fieldfield)),
      child: DropdownButton<RoleModel>(
        borderRadius: BorderRadius.circular(SizesConfig.md),
        isExpanded: true,
        value: value,
        underline: const SizedBox(),
        focusColor: AppColors.whiteColor,
        icon: const Icon(Icons.keyboard_arrow_down_sharp),
        elevation: 0,
        hint: Text(
          "select your role",
          style: AppTextStyle.subtitle03(color: AppColors.fontDarkColor),
        ),
        style: AppTextStyle.subtitle03(color: AppColors.fontDarkColor),
        dropdownColor: AppColors.fieldfield,
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
