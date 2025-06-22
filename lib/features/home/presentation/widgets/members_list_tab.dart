import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_mobile/core/network/enums.dart';
import 'package:two_mobile/core/widgets/status-boxs/loading_status_box.dart';
import 'package:two_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_mobile/features/home/presentation/widgets/custom_employee_card.dart';
import 'package:two_mobile/features/role/data/models/employee_model.dart';

class MembersListTab extends StatelessWidget {
  const MembersListTab({
    super.key,
    required this.roleId,
    required this.onAdd,
    required this.selectedEmployees,
  });

  final int roleId;
  final Function(EmployeeModel) onAdd;
  final List<EmployeeModel> selectedEmployees;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (previous, current) =>
            (previous.employeeListStatus != current.employeeListStatus),
        builder: (context, state) {
          if (state.employeeListStatus == CasualStatus.loading) {
            return const LoadingStatusBox();
          } else if (state.employeeListStatus == CasualStatus.success) {
            return ListView.builder(
              itemCount: state.employeeList.length,
              itemBuilder: (context, index) {
                final employee = state.employeeList[index];
                final isSelected = selectedEmployees.contains(employee);
                return CustomEmployeeCard(
                  employeeModel: employee,
                  isSelected: isSelected,
                  onTap: () => onAdd(employee),
                );
              },
            );
          } else {
            return Center(child: Text(state.masseage));
          }
        },
      ),
    );
  }
}
