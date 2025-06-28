// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class CustomTaskCard extends StatelessWidget {
  final String priority;
  final String text;
  final String titletext;
  final String subtext;
  final String number;
  final String image;
  final Color color1;
  final Color color2;
  const CustomTaskCard(
      {super.key,
      required this.priority,
      required this.text,
      required this.color1,
      required this.color2,
      required this.titletext,
      required this.subtext,
      required this.number,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        shadowColor: AppColors.Darkgreen,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      width: 90,
                      decoration: BoxDecoration(
                          color: color1.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child: Text(
                          text,
                          style: AppTextStyle.subtitle02(color: color1),
                        ),
                      )),
                  PaddingConfig.w8,
                  Container(
                      width: 70,
                      decoration: BoxDecoration(
                          color: color2.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 6,
                            color: color2,
                          ),
                          SizedBox(width: 2),
                          Text(
                            priority,
                            style: AppTextStyle.subtitle02(color: color2),
                          ),
                        ],
                      )),
                ],
              ),
              PaddingConfig.h8,
              Text(
                titletext,
                style: AppTextStyle.subtitle02(),
              ),
              Text(
                subtext,
                style: AppTextStyle.subtitle04(color: AppColors.fontLightColor),
              ),
              PaddingConfig.h8,
              Divider(
                color: AppColors.fontLightColor.withOpacity(0.6),
              ),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage(image))),
                  ),
                  PaddingConfig.w8,
                  Icon(Iconsax.clock,
                      size: 18, color: AppColors.fontLightColor),
                  PaddingConfig.w4,
                  Text(
                    '11: 00 am - 12: 00 am',
                    style: AppTextStyle.subtitle03(
                        color: AppColors.fontLightColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Icon(Iconsax.message,
                        size: 20, color: AppColors.fontLightColor),
                  ),
                  PaddingConfig.w4,
                  Text(
                    number,
                    style: AppTextStyle.subtitle01(
                        color: AppColors.fontLightColor),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
