// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class Customchangecontainer extends StatefulWidget {
  final String text;
  const Customchangecontainer({required this.text, super.key});

  @override
  State<Customchangecontainer> createState() => _CustomchangecontainerState();
}

class _CustomchangecontainerState extends State<Customchangecontainer> {
  Color _containercolor = AppColors.iconColor.withOpacity(0.2);
  Color _textcolor = AppColors.iconColor;
  void _toggleColor() {
    setState(() {
      if (_containercolor == AppColors.iconColor.withOpacity(0.2)) {
        _containercolor = AppColors.maingreen;
        _textcolor = AppColors.cardColor;
      } else {
        _containercolor = AppColors.iconColor.withOpacity(0.2);
        _textcolor = AppColors.iconColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: _containercolor, borderRadius: BorderRadius.circular(6)),
            child: Center(
                child: Text(
              widget.text,
              style: AppTextStyle.subtitle02(color: _textcolor),
            )),
          ),
        ],
      ),
    );
  }
}
