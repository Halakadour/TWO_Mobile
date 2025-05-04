// ignore_for_file: prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class CustomContainerCard extends StatelessWidget {
  final String image;
  final String containertext;
  final String Titletext;
  final String Datetext;
  final String Nametext;
  const CustomContainerCard(
      {required this.Datetext,
      required this.Nametext,
      required this.Titletext,
      required this.containertext,
      required this.image,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 340,
      child: Card(
        elevation: 8,
        shadowColor: AppColors.fontLightColor.withOpacity(0.4),
        color: AppColors.cardColor,
        child: Column(
          children: [
            Stack(children: [
              Container(
                  padding: EdgeInsets.all(10),
                  height: 140,
                  width: 400,
                  child: Image.asset(image)),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 30),
                child: Container(
                  width: 100,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.cardColor.withOpacity(0.4)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        containertext,
                        style:
                            AppTextStyle.subtitle03(color: AppColors.cardColor),
                      ),
                    ),
                  ),
                ),
              )
            ]),
            Text(
              Titletext,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: AppColors.iconColor,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'created by :',
                    style: AppTextStyle.subtitle02(
                        color: AppColors.fontLightColor),
                  ),
                  SizedBox(width: 6),
                  Text(
                    Nametext,
                    style: AppTextStyle.subtitle02(),
                  ),
                  SizedBox(width: 37),
                  Text(
                    Datetext,
                    style: AppTextStyle.subtitle03(
                        color: AppColors.fontLightColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
