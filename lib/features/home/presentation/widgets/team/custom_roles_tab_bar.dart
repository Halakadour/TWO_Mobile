import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/role/data/models/role_response_model.dart';

class CustomRolesTabBar extends StatelessWidget {
  const CustomRolesTabBar({
    super.key,
    required TabController? tabController,
    required this.roles,
  }) : _tabController = tabController;

  final TabController? _tabController;
  final List<RoleModel> roles;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      tabs: roles
          .map((role) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(role.role),
              ))
          .toList(),
      dividerColor: Colors.transparent,
      indicator: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: BorderRadius.circular(25),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: AppTextStyle.subtitle01(color: AppColors.whiteColor),
      unselectedLabelStyle:
          AppTextStyle.subtitle02(color: AppColors.fontLightColor),
    );
  }
}
