import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/functions/bloc_state_handling/role_state_handling.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_mobile/features/auth/presentation/widgets/fetch_image_file_circle.dart';
import 'package:two_mobile/features/auth/presentation/widgets/fetch_pdf_file_container.dart';
import 'package:two_mobile/features/role/data/models/role_response_model.dart';

class ProgrammerProfileForm extends StatefulWidget {
  const ProgrammerProfileForm({super.key});

  @override
  State<ProgrammerProfileForm> createState() => _ProgrammerProfileFormState();
}

class _ProgrammerProfileFormState extends State<ProgrammerProfileForm> {
  ValueNotifier<RoleModel?> selectedRole = ValueNotifier(null);
  ValueNotifier<String?> imagebase64 = ValueNotifier(null);
  ValueNotifier<String?> pdfbase64 = ValueNotifier(null);
  @override
  void didChangeDependencies() {
    context.read<AuthBloc>().add(GetProgrammerRoleEvent());
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    selectedRole.dispose();
    imagebase64.dispose();
    pdfbase64.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FetchImageFileCircle(
          imageB64: imagebase64.value,
          onUpdate: (newImage) {
            imagebase64.value = newImage;
          },
        ),
        PaddingConfig.h64,
        BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) =>
              previous.roleProgrammerListStatus !=
              current.roleProgrammerListStatus,
          builder: (context, state) {
            return RoleStateHandling().getDropDowmRolesListForProgrammer(
              state: state,
              selectedRole: selectedRole,
              onChanged: (value) {
                selectedRole.value = value;
              },
            );
          },
        ),
        PaddingConfig.h16,
        FetchPdfFileContainer(
          fileB64: pdfbase64.value,
          onUpdate: (newFile) {
            pdfbase64.value = newFile;
          },
        ),
        PaddingConfig.h180,
        GradientOutlineButton(
          onpressed: () {
            if (selectedRole.value != null &&
                imagebase64.value != null &&
                pdfbase64.value != null) {
              context.read<AuthBloc>().add(UpdateProgrammerProfileEvent(
                  image: imagebase64.value!,
                  cv: pdfbase64.value!,
                  roleId: selectedRole.value!.id.toString()));
            } else if (selectedRole.value == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Please select the role"),
                  backgroundColor: Colors.black,
                ),
              );
            } else if (imagebase64.value == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Please select the image"),
                  backgroundColor: Colors.black,
                ),
              );
            } else if (pdfbase64.value == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Please select the Cv"),
                  backgroundColor: Colors.black,
                ),
              );
            }
          },
          text: 'continue',
          textColor: AppColors.cardColor,
          buttonColor: AppColors.buttonColor,
        )
      ],
    );
  }
}
