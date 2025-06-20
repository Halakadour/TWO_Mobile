// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class TextFieldPage extends StatelessWidget {
  final String? text;
  final double height;
  final double width;
  final Color? color;
  final Color textcolor;
  final Color Bordercolor;
  final Color textfield;
  final Color? iconcolor;
  final Color? bordercolor;
  final IconData? prefix;
  final IconData? suffix;
  const TextFieldPage(
      {this.prefix,
      this.suffix,
      this.color,
      // ignore: non_constant_identifier_names
      required this.Bordercolor,
      required this.textcolor,
      required this.textfield,
      this.iconcolor,
      this.bordercolor,
      this.text,
      super.key,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
          maxLines: null,
          expands: true,
          textAlignVertical: TextAlignVertical.top,
          style: AppTextStyle.subtitle02(color: textfield),
          decoration: InputDecoration(
              filled: true,
              fillColor: color,
              hintText: text,
              hintStyle: AppTextStyle.subtitle02(color: textcolor),
              prefixIcon:
                  prefix != null ? Icon(prefix, color: iconcolor) : null,
              suffixIcon:
                  suffix != null ? Icon(suffix, color: iconcolor) : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Bordercolor,
                ),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)))),
    );
  }
}
