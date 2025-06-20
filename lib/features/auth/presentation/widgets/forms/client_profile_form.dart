import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/functions/bloc_state_handling/role_state_handling.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_mobile/features/auth/presentation/widgets/fetch_image_file_circle.dart';
import 'package:two_mobile/features/role/data/models/role_response_model.dart';

class ClientProfileForm extends StatefulWidget {
  const ClientProfileForm({super.key});

  @override
  State<ClientProfileForm> createState() => _ClientProfileFormState();
}

class _ClientProfileFormState extends State<ClientProfileForm> {
  ValueNotifier<RoleModel?> selectedRole = ValueNotifier(null);
  ValueNotifier<String?> imagebase64 = ValueNotifier(null);
  @override
  void didChangeDependencies() {
    context.read<AuthBloc>().add(GetClientRoleEvent());
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    selectedRole.dispose();
    imagebase64.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
              previous.roleClientListStatus != current.roleClientListStatus,
          builder: (context, state) {
            return RoleStateHandling().getDropDowmRolesListForClient(
              state: state,
              selectedRole: selectedRole,
              onChanged: (value) {
                selectedRole.value = value;
              },
            );
          },
        ),
        PaddingConfig.h250,
        GradientOutlineButton(
          onpressed: () {
            if (selectedRole.value != null && imagebase64.value != null) {
              context.read<AuthBloc>().add(UpdateClientProfileEvent(
                  roleid: selectedRole.value!.id.toString(),
                  image: imagebase64.value!));
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
