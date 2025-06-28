import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/functions/bloc_state_handling/project_state_handling.dart';
import 'package:two_mobile/features/home/presentation/bloc/home_bloc.dart';
import 'package:two_mobile/features/home/presentation/widgets/filters/project_filter_dialog.dart';
import 'package:two_mobile/core/widgets/buttons/custom_add_navy_button.dart';
import 'package:two_mobile/features/home/presentation/widgets/custom_back_icon_with_text.dart';

class RecentprojectPage extends StatelessWidget {
  const RecentprojectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.cardColor,
        body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: ListView(
              children: [
                const CustomBackIconWithText(text: 'Recent Projects'),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const ProjectFilterDialog(),
                      const SizedBox(width: 10),
                      CustomAddNavyButton(
                        text: "New Project",
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) =>
                      previous.showAllProjectStatus !=
                      current.showAllProjectStatus,
                  builder: (context, state) {
                    return ProjectStateHandling().showAllRecentProjects(state);
                  },
                ))
              ],
            )));
  }
}
