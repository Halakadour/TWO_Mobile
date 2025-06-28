import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/functions/bloc_state_handling/team_state_handling.dart';
import 'package:two_mobile/core/network/enums.dart';
import 'package:two_mobile/core/widgets/buttons/custom_add_green_button.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_mobile/features/home/presentation/bloc/home_bloc.dart';
import 'package:two_mobile/features/home/presentation/pages/team_name_text_field.dart';
import 'package:two_mobile/features/home/presentation/widgets/custom_back_icon_with_text.dart';
import 'package:two_mobile/features/home/presentation/widgets/team/custom_roles_tab_bar.dart';
import 'package:two_mobile/features/home/presentation/widgets/team/members_list_tab.dart';
import 'package:two_mobile/features/home/presentation/widgets/team/selected_manager_chip_card.dart';
import 'package:two_mobile/features/home/presentation/widgets/team/selected_members_chip_card.dart';
import 'package:two_mobile/features/role/data/models/employee_model.dart';
import 'package:two_mobile/features/role/data/models/role_response_model.dart';

class MakeTeamPage extends StatefulWidget {
  const MakeTeamPage({super.key});

  @override
  State<MakeTeamPage> createState() => _MakeTeamPageState();
}

class _MakeTeamPageState extends State<MakeTeamPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  List<RoleModel> roles = [];
  int currentIndex = 0;

  final ValueNotifier<List<EmployeeModel>> selectedMembersNotifier =
      ValueNotifier<List<EmployeeModel>>([]);
  ValueNotifier<EmployeeModel?> selectedManager = ValueNotifier(null);
  final TextEditingController _teamNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (_tabController != null) {
      _tabController!.dispose();
    }
    _tabController = TabController(length: roles.length, vsync: this);
    _tabController!.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    selectedMembersNotifier.dispose();
    _tabController?.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    final index = _tabController!.index;
    final roleId = roles[index].id;
    context
        .read<AuthBloc>()
        .add(GetEmployeeListWithRoleFilterEvent(roleFilter: roleId));
    setState(() {
      currentIndex = index;
    });
  }

  void onAddMember(EmployeeModel emp) {
    final current = selectedMembersNotifier.value;
    if (!current.contains(emp)) {
      selectedMembersNotifier.value = [...current, emp];
    }
  }

  @override
  void didChangeDependencies() {
    context.read<AuthBloc>().add(GetProgrammerRoleEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      body: Padding(
        padding: PaddingConfig.pagePadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomBackIconWithText(
                text: 'Make A Team',
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text('Team Name', style: AppTextStyle.subtitle01()),
                ],
              ),
              PaddingConfig.h16,
              // Team Name
              TeamNameTextField(controller: _teamNameController),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select Manager', style: AppTextStyle.subtitle01()),
                  CustomAddGreenButton(onTap: () async {
                    final selected = await context.pushNamed(
                      AppRouteConfig.addProjectManagerPage,
                    );
                    if (selected != null && selected is EmployeeModel) {
                      selectedManager.value = selected;
                    }
                  })
                ],
              ),
              PaddingConfig.h16,
              // selected manager
              SelectedManagerChipCard(
                selectedManager: selectedManager,
                onUpdate: (p0) => selectedManager.value = p0,
              ),
              // selceted members
              SelectedMembersChipCard(
                selectedMembersNotifier: selectedMembersNotifier,
                onUpdate: (p0) => selectedMembersNotifier.value = p0,
              ),
              Row(
                children: [
                  Text('Select Members', style: AppTextStyle.subtitle01()),
                ],
              ),
              PaddingConfig.h16,
              BlocBuilder<AuthBloc, AuthState>(
                buildWhen: (prev, curr) =>
                    prev.roleProgrammerListStatus !=
                    curr.roleProgrammerListStatus,
                builder: (context, state) {
                  return showProgrammerRolesTabBar(state, context);
                },
              ),
              const SizedBox(height: 20),
              BlocListener<HomeBloc, HomeState>(
                listener: (context, state) {
                  TeamStateHandling().createTeam(state, context);
                },
                listenWhen: (previous, current) =>
                    previous.createTeamStatus != current.createTeamStatus,
                child: GradientOutlineButton(
                  onpressed: () {
                    if (selectedMembersNotifier.value.isNotEmpty &&
                        selectedManager.value != null) {
                      List<int> memebersIdList = selectedMembersNotifier.value
                          .map((e) => e.id)
                          .toList();
                      context.read<HomeBloc>().add(
                            CreateTeamEvent(
                              name: _teamNameController.text,
                              teamManager: selectedManager.value!.id.toString(),
                              teamMember: memebersIdList,
                            ),
                          );
                    }
                  },
                  text: 'Create A Team',
                  textColor: AppColors.cardColor,
                  buttonColor: AppColors.buttonColor,
                ),
              ),
              const SizedBox(height: 12),
              GradientOutlineButton(
                onpressed: () => context.pop(),
                text: 'Cancel',
                textColor: AppColors.greenColor,
                buttonColor: AppColors.buttonColor2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showProgrammerRolesTabBar(AuthState state, BuildContext context) {
    if (state.roleProgrammerListStatus == CasualStatus.loading) {
      return const Text("loading...");
    } else if (state.roleProgrammerListStatus == CasualStatus.success) {
      roles = state.roleProgrammerList;
      _tabController = TabController(
          length: roles.length, vsync: this, initialIndex: currentIndex)
        ..addListener(_onTabChanged);
      if (roles.isNotEmpty) {
        final firstRoleId = roles[0].id;
        context
            .read<AuthBloc>()
            .add(GetEmployeeListWithRoleFilterEvent(roleFilter: firstRoleId));
      }
      return Column(
        children: [
          CustomRolesTabBar(tabController: _tabController, roles: roles),
          PaddingConfig.h16,
          SizedBox(
            height: 300,
            child: IndexedStack(
              index: currentIndex,
              children: roles
                  .map((role) => MembersListTab(
                        roleId: role.id,
                        onAdd: onAddMember,
                        selectedEmployees: selectedMembersNotifier.value,
                      ))
                  .toList(),
            ),
          )
        ],
      );
    } else {
      return const Text("failed to load roles");
    }
  }
}
