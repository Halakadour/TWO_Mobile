import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/network/enums.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/core/widgets/status-boxs/loading_status_box.dart';
import 'package:two_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_mobile/features/home/presentation/pages/make_team_page.dart';
import 'package:two_mobile/features/home/presentation/widgets/team/custom_employee_card.dart';
import 'package:two_mobile/features/home/presentation/widgets/custom_back_icon_with_text.dart';
import 'package:two_mobile/features/home/presentation/widgets/custom_text_field_for_home.dart';
import 'package:two_mobile/features/role/data/models/employee_model.dart';

class AddProjectManagerPage extends StatefulWidget {
  const AddProjectManagerPage({super.key});

  @override
  State<AddProjectManagerPage> createState() => _AddProjectManagerPageState();
}

class _AddProjectManagerPageState extends State<AddProjectManagerPage> {
  @override
  void didChangeDependencies() {
    context
        .read<AuthBloc>()
        .add(GetEmployeeListWithRoleFilterEvent(roleFilter: 7));
    super.didChangeDependencies();
  }

  ValueNotifier<EmployeeModel?> selectedManager = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      body: Padding(
        padding: PaddingConfig.pagePadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomBackIconWithText(text: 'Add Project Manger '),
              const SizedBox(height: 25),
              const CustomTextFieldForHome(
                height: 55,
                width: 340,
                bordercolor: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: Iconsax.search_normal_1,
                suffix: null,
                text: 'Search',
                textcolor: AppColors.fontLightColor,
                iconcolor: AppColors.fontLightColor,
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 400,
                child: BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (previous, current) =>
                      (previous.employeeListStatus !=
                          current.employeeListStatus),
                  builder: (context, state) {
                    if (state.employeeListStatus == CasualStatus.loading) {
                      return const LoadingStatusBox();
                    } else if (state.employeeListStatus ==
                        CasualStatus.success) {
                      return ListView.builder(
                        itemCount: state.employeeList.length,
                        itemBuilder: (context, index) {
                          final employee = state.employeeList[index];
                          return ValueListenableBuilder(
                            valueListenable: selectedManager,
                            builder: (context, value, child) =>
                                CustomEmployeeCard(
                                    employeeModel: employee,
                                    isSelected: value == employee,
                                    onTap: () {
                                      selectedManager.value = employee;
                                    }),
                          );
                        },
                      );
                    } else {
                      return Center(child: Text(state.masseage));
                    }
                  },
                ),
              ),
              const SizedBox(height: 130),
              GradientOutlineButton(
                onpressed: () {
                  Navigator.pop(context, selectedManager.value);
                },
                text: 'Next',
                textColor: AppColors.cardColor,
                buttonColor: AppColors.buttonColor,
              ),
              const SizedBox(height: 12),
              GradientOutlineButton(
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MakeTeamPage()));
                },
                text: 'Or Make A New Team',
                textColor: AppColors.greenColor,
                buttonColor: AppColors.buttonColor2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
