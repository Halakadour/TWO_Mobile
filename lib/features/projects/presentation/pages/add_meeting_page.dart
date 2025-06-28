// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/home/presentation/widgets/custom_text_field_for_home.dart';

class AddMeetingPage extends StatelessWidget {
  const AddMeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.cardColor,
        appBar: AppBar(
          backgroundColor: AppColors.navColor,
          toolbarHeight: 90,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 20),
            child: IconButton(
              onPressed: () {
                context.pushNamed(AppRouteConfig.meeting);
              },
              icon: Icon(
                Iconsax.arrow_left,
                size: 30,
                color: AppColors.cardColor,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'Add Meeting',
              style: AppTextStyle.heading03(color: AppColors.cardColor),
            ),
          ),
        ),
        body: Padding(
          padding: PaddingConfig.pagePadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PaddingConfig.h8,
                Text('Title', style: AppTextStyle.subtitle01()),
                PaddingConfig.h8,
                CustomTextFieldForHome(
                  height: 60,
                  width: 340,
                  bordercolor: AppColors.fieldfield,
                  textfield: AppColors.blackColor,
                  color: AppColors.fieldfield,
                  prefix: Iconsax.document_text,
                  suffix: null,
                  text: 'Meeting Title',
                  textcolor: AppColors.fontLightColor,
                  iconcolor: AppColors.fontLightColor,
                ),
                PaddingConfig.h16,
                Text('Type', style: AppTextStyle.subtitle01()),
                PaddingConfig.h8,
                CustomTextFieldForHome(
                  height: 60,
                  width: 340,
                  bordercolor: AppColors.fieldfield,
                  textfield: AppColors.blackColor,
                  color: AppColors.fieldfield,
                  prefix: Iconsax.tick_square,
                  suffix: Iconsax.arrow_down_14,
                  text: 'Meeting Type',
                  textcolor: AppColors.fontLightColor,
                  iconcolor: AppColors.fontLightColor,
                ),
                PaddingConfig.h16,
                Text('Date', style: AppTextStyle.subtitle01()),
                PaddingConfig.h8,
                CustomTextFieldForHome(
                  height: 60,
                  width: 340,
                  bordercolor: AppColors.fieldfield,
                  textfield: AppColors.blackColor,
                  color: AppColors.fieldfield,
                  prefix: Iconsax.calendar_1,
                  suffix: null,
                  text: 'Meeting Date',
                  textcolor: AppColors.fontLightColor,
                  iconcolor: AppColors.fontLightColor,
                ),
                PaddingConfig.h16,
                Text('Time', style: AppTextStyle.subtitle01()),
                PaddingConfig.h8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextFieldForHome(
                      height: 60,
                      width: 160,
                      bordercolor: AppColors.fieldfield,
                      textfield: AppColors.blackColor,
                      color: AppColors.fieldfield,
                      prefix: Iconsax.clock,
                      suffix: null,
                      text: 'Start Time',
                      textcolor: AppColors.fontLightColor,
                      iconcolor: AppColors.fontLightColor,
                    ),
                    CustomTextFieldForHome(
                      height: 60,
                      width: 160,
                      bordercolor: AppColors.fieldfield,
                      textfield: AppColors.blackColor,
                      color: AppColors.fieldfield,
                      prefix: Iconsax.clock,
                      suffix: null,
                      text: 'End Time',
                      textcolor: AppColors.fontLightColor,
                      iconcolor: AppColors.fontLightColor,
                    ),
                  ],
                ),
                PaddingConfig.h48,
                Row(
                  children: [
                    Container(
                      width: 120,
                      height: 43,
                      decoration: BoxDecoration(
                          color: AppColors.maingreen,
                          borderRadius: BorderRadius.circular(8),
                          border: Border(
                              left: BorderSide(color: AppColors.fontDarkColor),
                              bottom: BorderSide(
                                  color: AppColors.fontDarkColor, width: 2))),
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              side:
                                  const BorderSide(color: Colors.transparent)),
                          onPressed: () {},
                          child: Text('save',
                              style: AppTextStyle.heading04(
                                  color: AppColors.cardColor))),
                    ),
                    PaddingConfig.w16,
                    Container(
                      width: 120,
                      height: 43,
                      decoration: BoxDecoration(
                          color: AppColors.fontDarkColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                          border: Border(
                              left: BorderSide(color: AppColors.fontDarkColor),
                              bottom: BorderSide(
                                  color: AppColors.fontDarkColor, width: 2))),
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              side:
                                  const BorderSide(color: Colors.transparent)),
                          onPressed: () {},
                          child: Text('cancel',
                              style: AppTextStyle.heading04(
                                  color: AppColors.cardColor))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
