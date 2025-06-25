part of 'home_bloc.dart';

abstract class HomeEvent {}

// create team
class CreateTeamEvent extends HomeEvent {
  final String name;
  final String teamManager;
  final List<int> teamMember;
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

// show team
class ShowTeamEvent extends HomeEvent {}

// update project
class UpdateProjectEvent extends HomeEvent {
  String flullName;
  String companyName;
  String email;
  String phone;
  String projectType;
  String projectDescraption;
  String cost;
  String duration;
  String requirements;
  String document;
  String cooperationType;
  String contactTime;
  String private;
  String projectId;
  String token;
  UpdateProjectEvent({
    required this.flullName,
    required this.companyName,
    required this.email,
    required this.phone,
    required this.projectType,
    required this.projectDescraption,
    required this.cost,
    required this.duration,
    required this.document,
    required this.requirements,
    required this.cooperationType,
    required this.contactTime,
    required this.private,
    required this.projectId,
    required this.token,
  });
}

// Specify Project Team
class SpecifyProjectTeamEvent extends HomeEvent {
  String projectId;
  String teamId;
  String token;
  SpecifyProjectTeamEvent({
    required this.projectId,
    required this.teamId,
    required this.token,
  });
}

// show all project
class ShowAllProjectEvent extends HomeEvent {}
