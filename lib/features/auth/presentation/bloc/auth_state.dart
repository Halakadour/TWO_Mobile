part of 'auth_bloc.dart';

class AuthState {
  String masseage;
  CasualStatus userModelStatus;
  UserModel? userModel;
  AuthState(
      {this.masseage = "",
      this.userModel,
      this.userModelStatus = CasualStatus.initial});

  AuthState copyWith({
    String? masseage,
    CasualStatus? authModelStatus,
    UserModel? userModel,
  }) {
    return AuthState(
      masseage: masseage ?? this.masseage,
      userModelStatus: authModelStatus ?? this.userModelStatus,
      userModel: userModel ?? this.userModel,
    );
  }
}
