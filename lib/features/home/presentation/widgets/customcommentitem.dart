// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class CustomCommentItem extends StatelessWidget {
  final String name;
  final String role;
  final String comment;
  final String image;
  const CustomCommentItem(
      {super.key,
      required this.name,
      required this.role,
      required this.comment,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.Lightblue),
        boxShadow: [
          BoxShadow(
            color: AppColors.fieldfield,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 23,
              backgroundImage: AssetImage(image),
            ),
            title: Text(
              name,
              style: AppTextStyle.subtitle01(),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  role,
                  style:
                      AppTextStyle.subtitle03(color: AppColors.fontLightColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              comment,
              style: AppTextStyle.subtitle02(color: AppColors.fontDarkColor),
            ),
          ),
        ],
      ),
    );
  }
}
