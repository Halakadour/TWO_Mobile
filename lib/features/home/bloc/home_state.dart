part of 'home_bloc.dart';

class HomeState {
  // create team
  String message;
  CasualStatus createTeamStatus;
  TeamResponseModel? teamResponseModel;

  // add members
  String messageAddMember;
  CasualStatus addMemberStatus;
  AddMembersResponseModel? addMembersResponseModel;
  HomeState({
    this.message = "",
    this.createTeamStatus = CasualStatus.initial,
    this.teamResponseModel,
    // add members
    this.messageAddMember = "",
    this.addMemberStatus = CasualStatus.initial,
    this.addMembersResponseModel,
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
  }) {
    return HomeState(
      // create team
      message: message ?? this.message,
      createTeamStatus: createTeamStatus ?? this.createTeamStatus,
      teamResponseModel: teamResponseModel ?? this.teamResponseModel,

      // add members
      messageAddMember: messageAddMember ?? this.messageAddMember,
      addMemberStatus: addMemberStatus ?? this.addMemberStatus,
      addMembersResponseModel:
          addMembersResponseModel ?? this.addMembersResponseModel,
    );
  }
}
