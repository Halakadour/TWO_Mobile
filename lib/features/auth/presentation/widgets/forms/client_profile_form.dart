import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/network/enums.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/core/widgets/dropdown-list/drop_down_list_for_role_model.dart';
import 'package:two_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_mobile/features/auth/presentation/widgets/fetch_image_file_circle.dart';
import 'package:two_mobile/features/auth/role/data/models/role_model.dart';

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
            return getDropDowmRolesList(state);
          },
        ),
        PaddingConfig.h250,
        GradientOutlineButton(
          onpressed: () {
            if (selectedRole.value != null && imagebase64.value != null) {
              print("Not empty");
              print(imagebase64.value);
              print(selectedRole.value!.role);
              context.read<AuthBloc>().add(UpdateClientProfileEvent(
                  roleid: selectedRole.value!.id.toString(),
                  image: imagebase64.value!));
            }
          },
          text: 'continue',
          textColor: AppColors.cardColor,
          buttonColor: AppColors.buttonColor,
        )
      ],
    );
  }

  Widget getDropDowmRolesList(AuthState state) {
    if (state.roleClientListStatus == CasualStatus.success) {
      if (state.roleClientList.isNotEmpty) {
        return ValueListenableBuilder<RoleModel?>(
          valueListenable: selectedRole,
          builder: (context, roleValue, _) {
            return CustomDropdownListForRoleModel(
              value: roleValue,
              items: state.roleClientList.map((role) {
                return DropdownMenuItem(value: role, child: Text(role.role));
              }).toList(),
              onChanged: (value) {
                selectedRole.value = value;
              },
            );
          },
        );
      } else {
        return const Text("No Roles");
      }
    } else if (state.roleClientListStatus == CasualStatus.loading) {
      return const Text("Loading");
    } else if (state.roleClientListStatus == CasualStatus.failure) {
      return Text(state.masseage);
    } else {
      return const SizedBox();
    }
  }
}
