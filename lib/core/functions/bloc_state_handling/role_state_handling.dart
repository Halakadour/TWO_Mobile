import 'package:flutter/material.dart';
import 'package:two_mobile/core/network/enums.dart';
import 'package:two_mobile/core/widgets/dropdown-list/drop_down_list_for_role_model.dart';
import 'package:two_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_mobile/features/role/data/models/role_response_model.dart';

class RoleStateHandling {
  // For The Client
  Widget getDropDowmRolesListForClient({
    required AuthState state,
    required ValueNotifier<RoleModel?> selectedRole,
    required void Function(RoleModel?) onChanged,
  }) {
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
              onChanged: onChanged,
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

  // For The Programmer
  Widget getDropDowmRolesListForProgrammer({
    required AuthState state,
    required ValueNotifier<RoleModel?> selectedRole,
    required void Function(RoleModel?) onChanged,
  }) {
    if (state.roleProgrammerListStatus == CasualStatus.success) {
      if (state.roleProgrammerList.isNotEmpty) {
        return ValueListenableBuilder<RoleModel?>(
          valueListenable: selectedRole,
          builder: (context, roleValue, _) {
            return CustomDropdownListForRoleModel(
              value: roleValue,
              items: state.roleProgrammerList.map((role) {
                return DropdownMenuItem(value: role, child: Text(role.role));
              }).toList(),
              onChanged: onChanged,
            );
          },
        );
      } else {
        return const Text("No Roles");
      }
    } else if (state.roleProgrammerListStatus == CasualStatus.loading) {
      return const Text("Loading");
    } else if (state.roleProgrammerListStatus == CasualStatus.failure) {
      return Text(state.masseage);
    } else {
      return const SizedBox();
    }
  }
}
