import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_mobile/core/functions/bloc_state_handling/project_state_handling.dart';
import 'package:two_mobile/features/home/presentation/bloc/home_bloc.dart';

class CustomProjectCardsPageView extends StatefulWidget {
  const CustomProjectCardsPageView({super.key});

  @override
  State<CustomProjectCardsPageView> createState() =>
      _CustomProjectCardsPageViewState();
}

class _CustomProjectCardsPageViewState
    extends State<CustomProjectCardsPageView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 202, left: 20, right: 20, bottom: 280),
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.showAllProjectStatus != current.showAllProjectStatus,
        builder: (context, state) {
          return ProjectStateHandling().showAllProjectsListForPageView(state);
        },
      ),
    );
  }
}
