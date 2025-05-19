part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({
    required this.email,
    required this.password,
  });
}

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;

  SignUpEvent(
      {required this.name,
      required this.email,
      required this.password,
      required this.passwordConfirmation});
}

class UpdateClientProfileEvent extends AuthEvent {
  String roleid;
  String image;
  String subject;
  String phone;

  UpdateClientProfileEvent(
      {required this.roleid,
      required this.image,
      required this.subject,
      required this.phone});
}
