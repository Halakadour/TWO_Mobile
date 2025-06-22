part of 'home_bloc.dart';

class HomeState {
  // create team
  String message;
  CasualStatus createTeamStatus;

  // add members
  String messageAddMember;
  CasualStatus addMemberStatus;

  // show team
  CasualStatus teamListStatus;
  String messageShowTeam;
  List<TeamModel> teamList;

  // update prject
  CasualStatus updateProjectStatus;
  String messageUpdateProject;

  // Specify Project Team
  CasualStatus specifyProjectTeamStatus;
  String messageSpecifyProjectTeam;

  HomeState({
    // create team
    this.message = "",
    this.createTeamStatus = CasualStatus.initial,

    // add members
    this.messageAddMember = "",
    this.addMemberStatus = CasualStatus.initial,

    // show team
    this.messageShowTeam = "",
    this.teamListStatus = CasualStatus.initial,
    this.teamList = const [],

    //update project
    this.updateProjectStatus = CasualStatus.initial,
    this.messageUpdateProject = "",

    // Specify Project Team
    this.specifyProjectTeamStatus = CasualStatus.initial,
    this.messageSpecifyProjectTeam = "",
  });
  HomeState copyWith({
    // create team
    String? message,
    CasualStatus? createTeamStatus,
    TeamResponseModel? teamResponseModel,

    // add member
    String? messageAddMember,
    CasualStatus? addMemberStatus,
    AddMembersResponseModel? addMembersResponseModel,

    // show team
    String? messageShowTeam,
    CasualStatus? showTeamStatus,
    List<TeamModel>? listTeam,

    // update project
    String? messageUpdateProject,
    CasualStatus? updateProjectStatus,

    // Specify Project Team
    CasualStatus? specifyProjectTeamStatus,
    String? messageSpecifyProjectTeam,
  }) {
    return HomeState(
      // create team
      message: message ?? this.message,
      createTeamStatus: createTeamStatus ?? this.createTeamStatus,

      // add members
      messageAddMember: messageAddMember ?? this.messageAddMember,
      addMemberStatus: addMemberStatus ?? this.addMemberStatus,

      // show team
      messageShowTeam: messageShowTeam ?? this.messageShowTeam,
      teamListStatus: showTeamStatus ?? this.teamListStatus,
      teamList: listTeam ?? this.teamList,

      // update project
      messageUpdateProject: messageUpdateProject ?? this.messageUpdateProject,
      updateProjectStatus: updateProjectStatus ?? this.updateProjectStatus,

      // Specify Project Team
      messageSpecifyProjectTeam:
          messageSpecifyProjectTeam ?? this.messageSpecifyProjectTeam,
      specifyProjectTeamStatus:
          specifyProjectTeamStatus ?? this.specifyProjectTeamStatus,
    );
  }
}
