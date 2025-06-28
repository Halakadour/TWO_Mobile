import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/paths/text_strings.dart';
import 'package:two_mobile/core/functions/bloc_state_handling/auth_state_handling.dart';
import 'package:two_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_mobile/features/auth/presentation/widgets/forms/programmer_profile_form.dart';
import 'package:two_mobile/features/home/presentation/widgets/custom_back_icon_with_text.dart';

class ProgrammerFillProfilePage extends StatelessWidget {
  const ProgrammerFillProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            previous.programmerProfileStatus != current.programmerProfileStatus,
        listener: (context, state) {
          AuthStateHandling().fillProgrammerProfile(state, context);
        },
        child: const Padding(
          padding: PaddingConfig.pagePadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomBackIconWithText(text: TextStrings.fillProfile),
                PaddingConfig.h64,
                ProgrammerProfileForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
