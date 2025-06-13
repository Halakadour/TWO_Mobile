part of 'auth_bloc.dart';

abstract class AuthEvent {}

// login
class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({
    required this.email,
    required this.password,
  });
}

// sign up
class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;

  SignUpEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });
}

// update client profile
class UpdateClientProfileEvent extends AuthEvent {
  String roleid;
  String image;

  UpdateClientProfileEvent({
    required this.roleid,
    required this.image,
  });
}

// update programmer profile
class UpdateProgrammerProfileEvent extends AuthEvent {
  final String image;
  final String cv;
  final String roleId;
  UpdateProgrammerProfileEvent({
    required this.image,
    required this.cv,
    required this.roleId,
  });
}

// get client role
class GetClientRoleEvent extends AuthEvent {}

// get programmer role
class GetProgrammerRoleEvent extends AuthEvent {}
