part of 'auth_bloc.dart';

class AuthState {
  // login & sign up & update profile
  String masseage;
  CasualStatus userModelStatus;
  UserModel? userModel;
  CasualStatus clientprofileStatus;
  UpdateClientProfileResponseModel? updateClientProfileResponseModel;
  UpdateEmployeeProfileResponseModel? updateEmployeeProfileResponseModel;
  CasualStatus programmerprofileStatus;

  // Role state
  CasualStatus roleClientListStatus;
  List<RoleModel> roleClientList;

  AuthState(
      {this.masseage = "",
      this.userModel,
      this.userModelStatus = CasualStatus.initial,
      this.clientprofileStatus = CasualStatus.initial,
      this.updateClientProfileResponseModel,
      this.programmerprofileStatus = CasualStatus.initial,
      this.updateEmployeeProfileResponseModel,
      this.roleClientListStatus = CasualStatus.initial,
      this.roleClientList = const []});

  AuthState copyWith({
    String? masseage,
    CasualStatus? authModelStatus,
    UserModel? userModel,
    CasualStatus? clientprofileStatus,
    UpdateClientProfileResponseModel? updateClientProfileResponseModel,
    CasualStatus? programmerprofileStatus,
    UpdateEmployeeProfileResponseModel? updateEmployeeProfileResponseModel,
    CasualStatus? roleClientListStatus,
    List<RoleModel>? roleClientList,
  }) {
    return AuthState(
        masseage: masseage ?? this.masseage,
        userModelStatus: authModelStatus ?? this.userModelStatus,
        userModel: userModel ?? this.userModel,
        clientprofileStatus: authModelStatus ?? this.clientprofileStatus,
        updateClientProfileResponseModel: updateClientProfileResponseModel ??
            this.updateClientProfileResponseModel,
        programmerprofileStatus:
            authModelStatus ?? this.programmerprofileStatus,
        updateEmployeeProfileResponseModel:
            updateEmployeeProfileResponseModel ??
                this.updateEmployeeProfileResponseModel,
        roleClientListStatus: roleClientListStatus ?? this.roleClientListStatus,
        roleClientList: roleClientList ?? this.roleClientList);
  }
}
