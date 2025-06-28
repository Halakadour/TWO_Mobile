import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/functions/bloc_state_handling/project_state_handling.dart';
import 'package:two_mobile/features/home/presentation/bloc/home_bloc.dart';
import 'package:two_mobile/features/home/presentation/widgets/custom_text_field_for_home.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  void didChangeDependencies() {
    context.read<HomeBloc>().add(ShowMyProjectEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.navColor,
                  ),
                  child: Padding(
                    padding: PaddingConfig.pagePadding,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, bottom: 30),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/png/logo.png',
                                height: 20,
                              ),
                              PaddingConfig.w8,
                              Text(
                                'My Projects',
                                style: AppTextStyle.heading03(
                                    color: AppColors.cardColor),
                              )
                            ],
                          ),
                        ),
                        const CustomTextFieldForHome(
                          height: 55,
                          width: 340,
                          bordercolor: AppColors.iconColor,
                          textfield: AppColors.cardColor,
                          text: 'Search your task',
                          color: AppColors.navColor,
                          prefix: Iconsax.search_normal_1,
                          suffix: Iconsax.menu,
                          textcolor: AppColors.iconColor,
                          iconcolor: AppColors.iconColor,
                        ),
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.cardColor,
                  ),
                )),
          ],
        ),
        Column(
          children: [
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) =>
                    previous.showMyProjectStatus != current.showMyProjectStatus,
                builder: (context, state) {
                  return ProjectStateHandling().showMyProjectList(state);
                },
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
