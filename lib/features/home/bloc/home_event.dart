part of 'home_bloc.dart';

abstract class HomeEvent {}

// create team
class CreateTeamEvent extends HomeEvent {
  final String name;
  final String teamManager;
  final String teamMember;
  CreateTeamEvent({
    required this.name,
    required this.teamManager,
    required this.teamMember,
  });
}

// add members
class AddMemberEvent extends HomeEvent {
  final String teamId;
  final List<int> teamMembers;

  AddMemberEvent({
    required this.teamId,
    required this.teamMembers,
  });
}
