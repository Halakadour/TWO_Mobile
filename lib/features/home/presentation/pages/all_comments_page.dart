// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/home/presentation/widgets/comment/custom_comment_item.dart';

class AllCommentsPage extends StatelessWidget {
  const AllCommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.navColor,
        toolbarHeight: 90,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 20),
          child: IconButton(
              onPressed: () {
                context.pushNamed(AppRouteConfig.taskDetatialsPage);
              },
              icon: Icon(
                Iconsax.arrow_left,
                size: 30,
                color: AppColors.cardColor,
              )),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            'All  Comments',
            style: AppTextStyle.heading03(color: AppColors.cardColor),
          ),
        ),
      ),
      body: Padding(
        padding: PaddingConfig.pagePadding,
        child: ListView(
          children: [
            CustomCommentItem(
                name: 'Alia Blue',
                role: 'Flutter-develope',
                comment:
                    'Great work han, I like the loading page design.\nnow please give me a feedback for my tasks too.',
                image: 'assets/images/png/profile 7.png'),
            CustomCommentItem(
                name: 'Harry Potter',
                role: 'UI/UX Designer',
                comment: 'It’s CLEAN design nice work han, keep going.',
                image: 'assets/images/png/image 2.png'),
            CustomCommentItem(
                name: 'Sam Holmes',
                role: 'backend-develope',
                comment:
                    'Wow 💥🤩 Nice work han, The design is full of interesting user expenses actions.',
                image: 'assets/images/png/image 1.png'),
            CustomCommentItem(
                name: 'Alia Blue',
                role: 'Flutter-develope',
                comment:
                    'Great work han, I like the loading page design.\nnow please give me a feedback for my tasks too.',
                image: 'assets/images/png/profile 7.png'),
            CustomCommentItem(
                name: 'Harry Potter',
                role: 'UI/UX Designer',
                comment: 'It’s CLEAN design nice work han, keep going.',
                image: 'assets/images/png/image 2.png'),
            CustomCommentItem(
                name: 'Sam Holmes',
                role: 'backend-develope',
                comment:
                    'Wow 💥🤩 Nice work han, The design is full of interesting user expenses actions.',
                image: 'assets/images/png/image 1.png')
          ],
        ),
      ),
    );
  }
}
