import 'package:flutter/material.dart';
import 'package:two_mobile/config/constants/baseuri.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/role/data/models/employee_model.dart';

class CustomEmployeeCard extends StatelessWidget {
  const CustomEmployeeCard({
    super.key,
    required this.employeeModel,
    required this.onTap,
    required this.isSelected,
  });

  final EmployeeModel employeeModel;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("$imageUri${employeeModel.image}"),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(employeeModel.name, style: AppTextStyle.subtitle02()),
              Text(
                employeeModel.role,
                style: AppTextStyle.subtitle03(
                  color: AppColors.fontLightColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 35,
              width: 80,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.cardColor : AppColors.maingreen,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? AppColors.maingreen : AppColors.cardColor,
                ),
              ),
              child: Center(
                child: Text(
                  isSelected ? 'Added' : 'Add',
                  style: AppTextStyle.subtitle01(
                    color:
                        isSelected ? AppColors.maingreen : AppColors.cardColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
