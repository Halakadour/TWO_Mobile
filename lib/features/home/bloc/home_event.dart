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
