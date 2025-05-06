// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class Customlist extends StatelessWidget {
  final String titletext;
  final String starttime;
  final String endtime;
  final String statusetext;
  final String proipritytext;
  final String timetext;
  final Color titlecolor;
  final Color proiperitycolor;
  const Customlist(
      {super.key,
      required this.titletext,
      required this.statusetext,
      required this.proipritytext,
      required this.timetext,
      required this.titlecolor,
      required this.proiperitycolor,
      required this.starttime,
      required this.endtime});

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
                            starttime,
                            style: AppTextStyle.subtitle03(),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 20),
                        child: Text(
                          endtime,
                          style: AppTextStyle.subtitle03(),
                        ),
                      )
                    ],
                  ),
                  VerticalDivider(
                    width: 20,
                    thickness: 2,
                    color: titlecolor,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            titletext,
                            style: AppTextStyle.subtitle01(color: titlecolor),
                          ),
                          SizedBox(width: 10),
                          Text(
                            timetext,
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
                                  color: titlecolor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: Text(
                                  statusetext,
                                  style: AppTextStyle.subtitle03(
                                      color: titlecolor),
                                ),
                              )),
                          SizedBox(width: 10),
                          Container(
                              width: 65,
                              height: 22,
                              decoration: BoxDecoration(
                                  color: proiperitycolor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 4,
                                    color: proiperitycolor,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    proipritytext,
                                    style: AppTextStyle.subtitle02(
                                        color: proiperitycolor),
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
