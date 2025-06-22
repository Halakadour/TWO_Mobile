// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class TextFieldPage extends StatelessWidget {
  final String? text;
  final double height;
  final double width;
  final Color? color;
  final Color textcolor;
  final Color bordercolor2;
  final Color textfield;
  final Color? iconcolor;
  final Color? bordercolor;
  final IconData? prefix;
  final IconData? suffix;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const TextFieldPage(
      {this.prefix,
      this.suffix,
      this.color,
      this.controller,
      this.validator,
      required this.bordercolor2,
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
      child: TextFormField(
          controller: controller,
          validator: validator,
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
                  color: bordercolor2,
                ),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)))),
    );
  }
}
