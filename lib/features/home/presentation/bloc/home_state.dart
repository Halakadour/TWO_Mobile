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

  // Specify Project team
  CasualStatus specifyProjectTeamStatus;
  String messageSpecifyProjectTeam;

// show all project
  CasualStatus showAllProjectStatus;
  List<ProjectModel> allProjectList;

// show my project
  CasualStatus? showMyProjectStatus;
  String messageShowmyProject;
  List<ProjectModel> myProjectList;

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

    // show all project
    this.showAllProjectStatus = CasualStatus.initial,
    this.allProjectList = const [],

    // show my project
    this.messageShowmyProject = "",
    this.myProjectList = const [],
    this.showMyProjectStatus = CasualStatus.initial,
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

    // show all project
    CasualStatus? showAllProjectStatus,
    List<ProjectModel>? allProjectList,

    // show my project
    CasualStatus? showMyPorjectStatus,
    List<ProjectModel>? myProjectList,
    String? messageShowmyProject,
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

      // show all project
      showAllProjectStatus: showAllProjectStatus ?? this.showAllProjectStatus,
      allProjectList: allProjectList ?? this.allProjectList,

      // show my project
      showMyProjectStatus: showMyProjectStatus ?? this.showMyProjectStatus,
      myProjectList: myProjectList ?? this.myProjectList,
      messageShowmyProject: messageShowmyProject ?? this.messageShowmyProject,
    );
  }
}
