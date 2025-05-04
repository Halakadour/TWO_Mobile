// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class customContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconcolor;
  final Color textcolor;
  final Color containercolor;
  const customContainer(
      {required this.containercolor,
      required this.textcolor,
      required this.text,
      required this.iconcolor,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6, bottom: 6, left: 12, right: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: containercolor),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: iconcolor,
            size: 20,
          ),
          SizedBox(width: 3),
          Text(
            text,
            style: AppTextStyle.subtitle03(color: textcolor),
          )
        ],
      ),
    );
  }
}
