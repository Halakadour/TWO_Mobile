part of 'home_bloc.dart';

class HomeState {
  // create team
  String message;
  CasualStatus createTeamStatus;
  TeamResponseModel? teamResponseModel;
  HomeState({
    this.message = "",
    this.createTeamStatus = CasualStatus.initial,
    this.teamResponseModel,
  });
  HomeState copyWith({
    String? message,
    CasualStatus? createTeamStatus,
    TeamResponseModel? teamResponseModel,
  }) {
    return HomeState(
      message: message ?? this.message,
      createTeamStatus: createTeamStatus ?? this.createTeamStatus,
      teamResponseModel: teamResponseModel ?? this.teamResponseModel,
    );
  }
}
