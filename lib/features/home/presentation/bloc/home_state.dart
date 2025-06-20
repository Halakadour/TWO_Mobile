part of 'home_bloc.dart';

class HomeState {
  // create team
  String message;
  CasualStatus createTeamStatus;

  // add members
  String messageAddMember;
  CasualStatus addMemberStatus;

  // show team
  CasualStatus showTeamStatus;
  String messageShowTeam;
  List<TeamModel> listTeam;

  HomeState({
    // create team
    this.message = "",
    this.createTeamStatus = CasualStatus.initial,

    // add members
    this.messageAddMember = "",
    this.addMemberStatus = CasualStatus.initial,

    // show team
    this.messageShowTeam = "",
    this.showTeamStatus = CasualStatus.initial,
    this.listTeam = const [],
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
      showTeamStatus: showTeamStatus ?? this.showTeamStatus,
      listTeam: listTeam ?? this.listTeam,
    );
  }
}
