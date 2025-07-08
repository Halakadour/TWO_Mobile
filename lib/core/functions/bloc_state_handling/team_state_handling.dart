import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:two_mobile/core/network/enums.dart';
import 'package:two_mobile/core/widgets/dialogs/custom_error_dialog.dart';
import 'package:two_mobile/core/widgets/dialogs/custom_loading_dialog.dart';
import 'package:two_mobile/core/widgets/dialogs/custom_success_dialog.dart';
import 'package:two_mobile/core/widgets/dialogs/do_not_have_account_dialog.dart';
import 'package:two_mobile/core/widgets/status-boxs/error_status_box.dart';
import 'package:two_mobile/core/widgets/status-boxs/loading_status_box.dart';
import 'package:two_mobile/features/home/presentation/bloc/home_bloc.dart';
import 'package:two_mobile/features/team/presentation/widgets/custom_team_card.dart';

import '../../../config/routes/app_route_config.dart';

class TeamStateHandling {
  Widget showTeamList(HomeState state) {
    if (state.teamListStatus == CasualStatus.loading) {
      return const LoadingStatusBox();
    } else if (state.teamListStatus == CasualStatus.success) {
      final teamList = state.teamList;
      return ListView.builder(
          itemCount: teamList.length,
          itemBuilder: (context, index) {
            return CustomTeamCard(
              team: teamList[index],
            );
          });
    } else if (state.teamListStatus == CasualStatus.failure) {
      return ErrorStatusBox(errorMessage: state.messageShowTeam);
    } else {
      return const SizedBox();
    }
  }

  // create team
  void createTeam(HomeState state, BuildContext context) {
    if (state.createTeamStatus == CasualStatus.loading) {
      showCustomLoadingDialog(context);
    } else if (state.createTeamStatus == CasualStatus.success) {
      context.pop();
      showSuccessDialog(
        context,
        () {
          context.pushReplacementNamed(AppRouteConfig.addTeam);
        },
      );
    } else if (state.createTeamStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.message);
    } else if (state.createTeamStatus == CasualStatus.noToken) {
      context.pop();
      doNotHaveAccountDialog(context);
    } else {
      const SizedBox();
    }
  }
}
