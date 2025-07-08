import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/functions/bloc_state_handling/project_state_handling.dart';
import 'package:two_mobile/features/home/presentation/bloc/home_bloc.dart';
import 'package:two_mobile/features/home/presentation/widgets/filters/project_filter_dialog.dart';
import 'package:two_mobile/core/widgets/buttons/custom_add_navy_button.dart';
import 'package:two_mobile/features/home/presentation/widgets/custom_back_icon_with_text.dart';

class RecentprojectPage extends StatefulWidget {
  const RecentprojectPage({super.key});

  @override
  State<RecentprojectPage> createState() => _RecentprojectPageState();
}

class _RecentprojectPageState extends State<RecentprojectPage> {
  // @override
  // void didChangeDependencies() {
  //   context.read<HomeBloc>().add(ShowAllProjectEvent());
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.cardColor,
        body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomBackIconWithText(text: 'Recent Projects'),
                PaddingConfig.h16,
                Row(
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
                PaddingConfig.h16,
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
