// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class Customlist extends StatelessWidget {
  final String Titletext;
  final String Starttime;
  final String Endtime;
  final String Statusetext;
  final String Proipritytext;
  final String Timetext;
  final Color Titlecolor;
  final Color Proiperitycolor;
  const Customlist(
      {super.key,
      required this.Titletext,
      required this.Statusetext,
      required this.Proipritytext,
      required this.Timetext,
      required this.Titlecolor,
      required this.Proiperitycolor,
      required this.Starttime,
      required this.Endtime});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Card(
            elevation: 10,
            shadowColor: AppColors.fontLightColor.withOpacity(0.4),
            color: AppColors.cardColor,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15,
                              color: AppColors.blackColor,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            Starttime,
                            style: AppTextStyle.subtitle03(),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 20),
                        child: Text(
                          Endtime,
                          style: AppTextStyle.subtitle03(),
                        ),
                      )
                    ],
                  ),
                  VerticalDivider(
                    width: 20,
                    thickness: 2,
                    color: Titlecolor,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Titletext,
                            style: AppTextStyle.subtitle01(color: Titlecolor),
                          ),
                          SizedBox(width: 10),
                          Text(
                            Timetext,
                            style: AppTextStyle.subtitle03(
                                color: AppColors.fontLightColor),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                              width: 90,
                              height: 22,
                              decoration: BoxDecoration(
                                  color: Titlecolor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: Text(
                                  Statusetext,
                                  style: AppTextStyle.subtitle03(
                                      color: Titlecolor),
                                ),
                              )),
                          SizedBox(width: 10),
                          Container(
                              width: 65,
                              height: 22,
                              decoration: BoxDecoration(
                                  color: Proiperitycolor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 4,
                                    color: Proiperitycolor,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    Proipritytext,
                                    style: AppTextStyle.subtitle02(
                                        color: Proiperitycolor),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
