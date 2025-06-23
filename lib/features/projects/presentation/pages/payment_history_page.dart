// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/projects/presentation/widgets/paymenttable.dart';

class PaymentHistoryPage extends StatelessWidget {
  final tableData = [
    ['#1279', '\$2,150,000', 'June 01–12,2020', 'Success'],
    ['#8236', '\$15,900,000', 'June 19–12, 2020', 'Success'],
    ['#9107', '\$180,000', 'June 23–01, 2021', 'Pending'],
    ['#5237', '\$146,468', 'June 20–02, 2021', 'Failed'],
    ['#6743', '\$19,000,000', 'June 16–03, 2021', 'Success'],
  ];
  PaymentHistoryPage({super.key});

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
                context.pushNamed(AppRouteConfig.sprintDetailes);
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
            'Payment History',
            style: AppTextStyle.heading03(color: AppColors.cardColor),
          ),
        ),
      ),
      body: Padding(
        padding: PaddingConfig.pagePadding,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.fontLightColor, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: PaymentTableWithBorders(data: tableData),
          ),
        ),
      ),
    );
  }
}
