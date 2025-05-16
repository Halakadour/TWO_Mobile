// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/home/presentation/widgets/customchangecontainer.dart';
import 'package:two_mobile/features/home/presentation/widgets/customcontainer.dart';
import 'package:two_mobile/features/home/presentation/widgets/customtext.dart';

class CustomAlterDialog2 extends StatelessWidget {
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            actionsPadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            content: SizedBox(
              height: 0,
              width: 300,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Filter by :',
                  style: AppTextStyle.heading04(),
                ),
                SizedBox(
                  height: 10,
                ),
                Customtext(text: 'status'),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Customchangecontainer(text: 'Completed'),
                    Customchangecontainer(text: 'In-Progress'),
                    Customchangecontainer(text: 'Canceled'),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Customtext(text: 'rate'),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Customchangecontainer(text: 'From-Highest'),
                    SizedBox(
                      width: 10,
                    ),
                    Customchangecontainer(text: 'From-Lowest'),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Customtext(text: 'name'),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Customchangecontainer(text: 'Ascending'),
                    SizedBox(
                      width: 10,
                    ),
                    Customchangecontainer(text: 'Descending'),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Customtext(text: 'date'),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Customchangecontainer(text: 'From-Latest'),
                    SizedBox(
                      width: 10,
                    ),
                    Customchangecontainer(text: 'From-Oldest'),
                  ],
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Apply',
                        style: AppTextStyle.subtitle02(
                            color: AppColors.greenColor),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: AppTextStyle.subtitle02(
                            color: AppColors.fontLightColor),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  const CustomAlterDialog2({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDialog(context);
      },
      child: customContainer(
          containercolor: AppColors.maingray,
          textcolor: AppColors.iconColor,
          text: 'Filter',
          iconcolor: AppColors.iconColor,
          icon: Iconsax.filter_edit),
    );
  }
}
