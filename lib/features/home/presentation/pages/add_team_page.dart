// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/functions/bloc_state_handling/team_state_handling.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/features/home/presentation/bloc/home_bloc.dart';
import 'package:two_mobile/features/home/presentation/widgets/custom_back_icon_with_text.dart';
import 'package:two_mobile/features/home/presentation/widgets/custom_text_field_for_home.dart';

class AddTeamPage extends StatefulWidget {
  const AddTeamPage({super.key});

  @override
  State<AddTeamPage> createState() => _AddTeamPageState();
}

class _AddTeamPageState extends State<AddTeamPage> {
  @override
  void didChangeDependencies() {
    context.read<HomeBloc>().add(ShowTeamEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      body: Padding(
        padding: PaddingConfig.pagePadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomBackIconWithText(text: 'Add Team'),
              SizedBox(height: 25),
              CustomTextFieldForHome(
                height: 55,
                width: 340,
                bordercolor: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: Iconsax.search_normal_1,
                suffix: null,
                text: 'Search',
                textcolor: AppColors.fontLightColor,
                iconcolor: AppColors.fontLightColor,
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 400,
                child: BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) =>
                      previous.teamListStatus != current.teamListStatus,
                  builder: (context, state) =>
                      TeamStateHandling().showTeamList(state),
                ),
              ),
              SizedBox(height: 20),
              GradientOutlineButton(
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddTeamPage()));
                },
                text: 'Next',
                textColor: AppColors.cardColor,
                buttonColor: AppColors.buttonColor,
              ),
              SizedBox(height: 12),
              GradientOutlineButton(
                onpressed: () {
                  context.pushNamed(AppRouteConfig.makeTeam);
                },
                text: 'Or Make A New Team',
                textColor: AppColors.greenColor,
                buttonColor: AppColors.buttonColor2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
