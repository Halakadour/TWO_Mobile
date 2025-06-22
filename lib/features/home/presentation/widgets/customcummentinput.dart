// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/features/home/presentation/widgets/textfield.dart';

class CustomCummentInput extends StatelessWidget {
  const CustomCummentInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade300, width: 1.5),
          left: BorderSide(color: Colors.grey.shade300, width: 1.5),
          right: BorderSide(color: Colors.grey.shade300, width: 1.5),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 13),
      child: Row(
        children: [
          CircleAvatar(
            radius: 23,
            backgroundImage: AssetImage('assets/images/png/profile 7.png'),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextFieldPage(
              height: 50,
              width: 50,
              bordercolor2: AppColors.fieldfield,
              textfield: AppColors.blackColor,
              color: AppColors.fieldfield,
              prefix: null,
              suffix: Iconsax.send_2,
              text: 'post a comment...',
              textcolor: AppColors.fontLightColor,
              iconcolor: AppColors.maingreen,
              bordercolor: AppColors.fieldfield,
            ),
          ),
        ],
      ),
    );
  }
}
