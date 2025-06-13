import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/functions/bloc_state_handling/auth_state_handling.dart';
import 'package:two_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_mobile/features/auth/presentation/widgets/forms/sign_up_form.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          await AuthStateHandling().signup(state, context);
        },
        listenWhen: (previous, current) =>
            previous.userModelStatus != current.userModelStatus,
        child: Padding(
          padding: PaddingConfig.pagePadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Create your\nAccount',
                        style: AppTextStyle.heading01(
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
                PaddingConfig.h8,
                const SignUpForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
