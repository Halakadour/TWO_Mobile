import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/functions/bloc_state_handling/team_state_handling.dart';
import 'package:two_mobile/core/network/enums.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_mobile/features/home/presentation/bloc/home_bloc.dart';
import 'package:two_mobile/features/home/presentation/widgets/customiconback.dart';
import 'package:two_mobile/features/home/presentation/widgets/members_list_tab.dart';
import 'package:two_mobile/features/home/presentation/widgets/textfield.dart';
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
    selectedMembersNotifier.dispose(); // مهم
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

  @override
  void didChangeDependencies() {
    context.read<AuthBloc>().add(GetProgrammerRoleEvent());
    super.didChangeDependencies();
  }

  void onAddMember(EmployeeModel emp) {
    final current = selectedMembersNotifier.value;
    if (!current.contains(emp)) {
      selectedMembersNotifier.value = [...current, emp];
    }
  }

  void onRemoveMember(EmployeeModel emp) {
    final current = selectedMembersNotifier.value;
    selectedMembersNotifier.value = current.where((e) => e != emp).toList();
  }

  void onRemoveManager(EmployeeModel emp) {
    selectedManager.value = null;
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
              Customiconback(
                onpressed: () => context.pop(),
                text: 'Make A Team',
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text('Team Name', style: AppTextStyle.subtitle01()),
                ],
              ),
              PaddingConfig.h16,
              TextFieldPage(
                height: 55,
                width: 340,
                bordercolor2: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: Iconsax.document_text,
                suffix: null,
                text: 'Team Name',
                textcolor: AppColors.fontLightColor,
                iconcolor: AppColors.fontLightColor,
                bordercolor: AppColors.fieldfield,
                controller: _teamNameController,
                validator: (p0) => p0 != null ? null : 'This field is requarid',
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select Manager', style: AppTextStyle.subtitle01()),
                  GestureDetector(
                    onTap: () async {
                      final selected = await context.pushNamed(
                        AppRouteConfig.addProjectManagerPage,
                      );
                      if (selected != null && selected is EmployeeModel) {
                        selectedManager.value = selected;
                      }
                    },
                    child: Container(
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppColors.maingreen,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.cardColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Add',
                          style: AppTextStyle.subtitle01(
                            color: AppColors.cardColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              PaddingConfig.h16,
              ValueListenableBuilder(
                valueListenable: selectedManager,
                builder: (context, selectedMembers, _) {
                  if (selectedMembers == null) return const SizedBox();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 225),
                        child: Text('Selected Manager',
                            style: AppTextStyle.subtitle01()),
                      ),
                      const SizedBox(height: 10),
                      Chip(
                        label: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(selectedManager.value!.name,
                                style: AppTextStyle.subtitle03()),
                            Text(
                              selectedManager.value!.role,
                              style: AppTextStyle.subtitle04(
                                  color: AppColors.fontLightColor),
                            ),
                          ],
                        ),
                        onDeleted: () =>
                            onRemoveManager(selectedManager.value!),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
              ValueListenableBuilder<List<EmployeeModel>>(
                valueListenable: selectedMembersNotifier,
                builder: (context, selectedMembers, _) {
                  if (selectedMembers.isEmpty) return const SizedBox();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 225),
                        child: Text('Selected Members',
                            style: AppTextStyle.subtitle01()),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: selectedMembers.map((emp) {
                          return Chip(
                            label: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(emp.name,
                                    style: AppTextStyle.subtitle03()),
                                Text(
                                  emp.role,
                                  style: AppTextStyle.subtitle04(
                                      color: AppColors.fontLightColor),
                                ),
                              ],
                            ),
                            onDeleted: () => onRemoveMember(emp),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
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
                  if (state.roleProgrammerListStatus == CasualStatus.loading) {
                    return const Text("loading...");
                  } else if (state.roleProgrammerListStatus ==
                      CasualStatus.success) {
                    roles = state.roleProgrammerList;

                    _tabController = TabController(
                        length: roles.length,
                        vsync: this,
                        initialIndex: currentIndex)
                      ..addListener(_onTabChanged);

                    if (roles.isNotEmpty) {
                      final firstRoleId = roles[0].id;
                      context.read<AuthBloc>().add(
                          GetEmployeeListWithRoleFilterEvent(
                              roleFilter: firstRoleId));
                    }

                    return Column(
                      children: [
                        TabBar(
                          controller: _tabController,
                          isScrollable: true,
                          tabs: roles
                              .map((role) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(role.role),
                                  ))
                              .toList(),
                          dividerColor: Colors.transparent,
                          indicator: BoxDecoration(
                            color: AppColors.greenColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelStyle: AppTextStyle.subtitle01(
                              color: AppColors.whiteColor),
                          unselectedLabelStyle: AppTextStyle.subtitle02(
                              color: AppColors.fontLightColor),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 300,
                          child: IndexedStack(
                            index: currentIndex,
                            children: roles
                                .map((role) => MembersListTab(
                                      roleId: role.id,
                                      onAdd: onAddMember,
                                      selectedEmployees:
                                          selectedMembersNotifier.value,
                                    ))
                                .toList(),
                          ),
                        )
                      ],
                    );
                  } else {
                    return const Text("failed to load roles");
                  }
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
                onpressed: () {},
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
}
