import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_mobile/core/network/enums.dart';
import 'package:two_mobile/core/services/shared_preferences_services.dart';
import 'package:two_mobile/core/widgets/dialogs/auth_success_dialog.dart';
import 'package:two_mobile/core/widgets/dialogs/custom_error_dialog.dart';
import 'package:two_mobile/core/widgets/dialogs/custom_loading_dialog.dart';
import 'package:two_mobile/features/auth/presentation/bloc/auth_bloc.dart';

class AuthStateHandling {
  // Login
  Future<void> login(AuthState state, BuildContext context) async {
    if (state.userModelStatus == CasualStatus.loading) {
      showCustomLoadingDialog(context);
    } else if (state.userModelStatus == CasualStatus.success) {
      await SharedPreferencesServices.setUserToken(state.userModel!.token);
      context.pop();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AuthSuccessDialog();
          });
    } else if (state.userModelStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.masseage);
    } else {
      const SizedBox();
    }
  }
}
