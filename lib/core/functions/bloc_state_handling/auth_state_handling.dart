import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/core/network/enums.dart';
import 'package:two_mobile/core/services/shared_preferences_services.dart';
import 'package:two_mobile/core/widgets/dialogs/auth_success_dialog.dart';
import 'package:two_mobile/core/widgets/dialogs/custom_error_dialog.dart';
import 'package:two_mobile/core/widgets/dialogs/custom_loading_dialog.dart';
import 'package:two_mobile/core/widgets/dialogs/custom_success_dialog.dart';
import 'package:two_mobile/core/widgets/dialogs/do_not_have_account_dialog.dart';
import 'package:two_mobile/core/widgets/dialogs/user_type_dialog.dart';
import 'package:two_mobile/features/auth/presentation/bloc/auth_bloc.dart';

class AuthStateHandling {
  // Login
  Future<void> login(AuthState state, BuildContext context) async {
    if (state.userModelStatus == CasualStatus.loading) {
      showCustomLoadingDialog(context);
    } else if (state.userModelStatus == CasualStatus.success) {
      await SharedPreferencesServices.setUserToken(state.userModel!.token);
      context.pop();
      showAuthSuccessDialog(context);
    } else if (state.userModelStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.masseage);
    } else {
      const SizedBox();
    }
  }

  // Signup
  Future<void> signup(AuthState state, BuildContext context) async {
    if (state.userModelStatus == CasualStatus.loading) {
      showCustomLoadingDialog(context);
    } else if (state.userModelStatus == CasualStatus.success) {
      await SharedPreferencesServices.setUserToken(state.userModel!.token);
      context.pop();
      selectUserTypeDialog(context);
    } else if (state.userModelStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.masseage);
    } else {
      const SizedBox();
    }
  }

  // fill client profile
  void fillClientProfile(AuthState state, BuildContext context) {
    if (state.clientProfileStatus == CasualStatus.loading) {
      showCustomLoadingDialog(context);
    } else if (state.clientProfileStatus == CasualStatus.success) {
      context.pop();
      showSuccessDialog(
        context,
        () {
          context.pushReplacementNamed(AppRouteConfig.main);
        },
      );
    } else if (state.clientProfileStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.masseage);
    } else if (state.clientProfileStatus == CasualStatus.noToken) {
      context.pop();
      doNotHaveAccountDialog(context);
    } else {
      const SizedBox();
    }
  }
}
