// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class CustomContainerPage extends StatelessWidget {
  final String text;
  final String number;
  final Color color;
  const CustomContainerPage(
      {super.key,
      required this.text,
      required this.number,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 220,
      decoration: BoxDecoration(
          color: AppColors.Lightblue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: AppTextStyle.subtitle01(color: color.withOpacity(0.6)),
                ),
                Container(
                  height: 23,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: color),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    number,
                    style: AppTextStyle.subtitle02(color: color),
                  )),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.cardColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ERD-Design',
                            style: AppTextStyle.subtitle01(),
                          ),
                          Text(
                            'designing the data base system...',
                            style: AppTextStyle.subtitle04(
                                color: AppColors.fontLightColor),
                          ),
                          PaddingConfig.h24,
                          Text(
                            'Due Date: Dec 15, 2024',
                            style: AppTextStyle.subtitle03(
                                color: AppColors.fontLightColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  PaddingConfig.h16,
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.cardColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Build-DataBase',
                            style: AppTextStyle.subtitle01(),
                          ),
                          Text(
                            'designing the data base system...',
                            style: AppTextStyle.subtitle04(
                                color: AppColors.fontLightColor),
                          ),
                          PaddingConfig.h24,
                          Text(
                            'Due Date: Dec 15, 2024',
                            style: AppTextStyle.subtitle03(
                                color: AppColors.fontLightColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  PaddingConfig.h16,
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.cardColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'UI-Design',
                            style: AppTextStyle.subtitle01(),
                          ),
                          Text(
                            'designing the data base system...',
                            style: AppTextStyle.subtitle04(
                                color: AppColors.fontLightColor),
                          ),
                          PaddingConfig.h24,
                          Text(
                            'Due Date: Dec 15, 2024',
                            style: AppTextStyle.subtitle03(
                                color: AppColors.fontLightColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  PaddingConfig.h16,
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.cardColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Build-mobile',
                            style: AppTextStyle.subtitle01(),
                          ),
                          Text(
                            'designing the data base system...',
                            style: AppTextStyle.subtitle04(
                                color: AppColors.fontLightColor),
                          ),
                          PaddingConfig.h24,
                          Text(
                            'Due Date: Dec 15, 2024',
                            style: AppTextStyle.subtitle03(
                                color: AppColors.fontLightColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
