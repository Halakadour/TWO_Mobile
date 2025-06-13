import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/functions/bloc_state_handling/auth_state_handling.dart';
import 'package:two_mobile/core/widgets/buttons/custom_back_button.dart';
import 'package:two_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_mobile/features/auth/presentation/widgets/forms/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          await AuthStateHandling().login(state, context);
        },
        listenWhen: (previous, current) =>
            previous.userModelStatus != current.userModelStatus,
        child: Padding(
          padding: PaddingConfig.pagePadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomBackButton(),
                PaddingConfig.h8,
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Login To Your\nAccount',
                        style: AppTextStyle.heading01(
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
