import 'package:flutter/material.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class CustomvisibilityBox extends StatefulWidget {
  const CustomvisibilityBox({super.key});

  @override
  State<CustomvisibilityBox> createState() => _CustomvisibilityBoxState();
}

class _CustomvisibilityBoxState extends State<CustomvisibilityBox> {
  String visibility = 'Private';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      height: 120,
      width: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.fieldfield,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visibility',
            style: AppTextStyle.subtitle02(color: AppColors.fontLightColor),
          ),
          PaddingConfig.h40,
          Row(
            children: [
              _buildOption('Private'),
              PaddingConfig.w32,
              _buildOption('Public'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOption(String option) {
    bool isSelected = (visibility == option);
    return GestureDetector(
      onTap: () {
        setState(() {
          visibility = option;
        });
      },
      child: Row(
        children: [
          Container(
            width: 23,
            height: 23,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color:
                    isSelected ? AppColors.maingreen : const Color(0xff838A9D),
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: AppColors.maingreen,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : null,
          ),
          PaddingConfig.w8,
          Text(option,
              style: AppTextStyle.subtitle02(
                color: AppColors.fontLightColor,
              )),
        ],
      ),
    );
  }
}
