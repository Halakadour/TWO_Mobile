part of 'auth_bloc.dart';

class AuthState {
  String masseage;
  CasualStatus authModelStatus;
  UserModel? userModel;
  AuthState(
      {this.masseage = "",
      this.userModel,
      this.authModelStatus = CasualStatus.initial});

  AuthState copyWith({
    CasualStatus? authModelStatus,
    UserModel? userModel,
  }) {
    return AuthState(
      authModelStatus: authModelStatus ?? this.authModelStatus,
      userModel: userModel ?? this.userModel,
    );
  }
}
