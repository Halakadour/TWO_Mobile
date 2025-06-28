import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class CustomMeetingCard extends StatelessWidget {
  final String title;
  final String time;
  final String description;
  final Color borderColor;
  const CustomMeetingCard(
      {super.key,
      required this.title,
      required this.time,
      required this.description,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(
            left: BorderSide(color: borderColor, width: 6),
            right: BorderSide(color: borderColor, width: 1.5),
            top: BorderSide(color: borderColor, width: 1.5),
            bottom: BorderSide(color: borderColor, width: 1.5)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Iconsax.box_1, color: borderColor),
              PaddingConfig.w16,
              Text(time,
                  style:
                      AppTextStyle.subtitle02(color: AppColors.fontLightColor)),
            ],
          ),
          PaddingConfig.h8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppTextStyle.subtitle01()),
              const Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Icon(
                  Icons.more_vert,
                  size: 30,
                  color: AppColors.Lightblue,
                ),
              ),
            ],
          ),
          Text(description,
              style: AppTextStyle.subtitle02(color: AppColors.fontLightColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
