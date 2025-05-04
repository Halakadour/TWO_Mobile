import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class Customtab extends StatelessWidget {
  const Customtab({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerHeight: 0.9,
      tabs: [
        Container(
          height: 40,
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.view_kanban_rounded,
                color: AppColors.blackColor.withOpacity(0.9),
              ),
              SizedBox(width: 8),
              Text(
                'Kanban',
                style: AppTextStyle.heading04(),
              ),
            ],
          ),
        ),
        Container(
          height: 40,
          width: 100,
          child: Row(
            children: [
              Icon(
                Icons.list_rounded,
                size: 30,
                color: AppColors.blackColor.withOpacity(0.9),
              ),
              SizedBox(width: 8),
              Text(
                'List',
                style: AppTextStyle.heading04(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
