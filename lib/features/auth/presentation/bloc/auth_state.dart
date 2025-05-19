part of 'auth_bloc.dart';

class AuthState {
  // login & sign up & update profile
  String masseage;
  CasualStatus userModelStatus;
  UserModel? userModel;
  CasualStatus clientprofileStatus;
  UpdateClientProfileResponseModel? updateClientProfileResponseModel;

  AuthState(
      {this.masseage = "",
      this.userModel,
      this.userModelStatus = CasualStatus.initial,
      this.clientprofileStatus = CasualStatus.initial,
      this.updateClientProfileResponseModel});

  AuthState copyWith({
    String? masseage,
    CasualStatus? authModelStatus,
    UserModel? userModel,
    CasualStatus? clientprofileStatus,
    UpdateClientProfileResponseModel? updateClientProfileResponseModel,
  }) {
    return AuthState(
      masseage: masseage ?? this.masseage,
      userModelStatus: authModelStatus ?? this.userModelStatus,
      userModel: userModel ?? this.userModel,
      clientprofileStatus: authModelStatus ?? this.clientprofileStatus,
      updateClientProfileResponseModel: updateClientProfileResponseModel ??
          this.updateClientProfileResponseModel,
    );
  }
}
