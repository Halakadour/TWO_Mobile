// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class TodayTask extends StatelessWidget {
  String title;
  String priority;
  String time;
  String status;
  Color textcolor;
  Color priopritycolor;
  Color statuscolor;
  Color iconcolor;

  TodayTask(
      {required this.title,
      required this.priority,
      required this.time,
      required this.status,
      required this.textcolor,
      required this.priopritycolor,
      required this.statuscolor,
      required this.iconcolor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: AppColors.fontLightColor.withOpacity(0.4),
      color: AppColors.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.subtitle02(),
                    ),
                    SizedBox(width: 10),
                    Container(
                        width: 70,
                        decoration: BoxDecoration(
                            color: textcolor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 6,
                              color: iconcolor,
                            ),
                            SizedBox(width: 2),
                            Text(
                              priority,
                              style: AppTextStyle.subtitle02(
                                  color: priopritycolor),
                            ),
                          ],
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50, top: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        size: 15,
                        color: AppColors.fontLightColor,
                      ),
                      SizedBox(width: 6),
                      Text(
                        time,
                        style: AppTextStyle.subtitle03(
                          color: AppColors.fontLightColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              status,
              style: AppTextStyle.subtitle02(color: statuscolor),
            ),
          ],
        ),
      ),
    );
  }
}
