part of 'auth_bloc.dart';

class AuthState {
  // login
  String masseage;
  CasualStatus userModelStatus;
  UserModel? userModel;
  // sign up
  CasualStatus signupModelstatus;
  SignUpModel? signUpModel;

  AuthState({
    this.masseage = "",
    this.userModel,
    this.userModelStatus = CasualStatus.initial,
    this.signupModelstatus = CasualStatus.initial,
    this.signUpModel,
  });

  AuthState copyWith({
    String? masseage,
    CasualStatus? authModelStatus,
    UserModel? userModel,
    CasualStatus? signupModelstatus,
    SignUpModel? signUpModel,
  }) {
    return AuthState(
      masseage: masseage ?? this.masseage,
      userModelStatus: authModelStatus ?? this.userModelStatus,
      userModel: userModel ?? this.userModel,
      signupModelstatus: authModelStatus ?? this.signupModelstatus,
      signUpModel: signUpModel ?? this.signUpModel,
    );
  }
}
