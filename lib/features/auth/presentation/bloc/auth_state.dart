// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState {
  // login & sign up
  String masseage;
  CasualStatus userModelStatus;
  UserModel? userModel;
  // update profile
  CasualStatus clientProfileStatus;
  CasualStatus programmerProfileStatus;

  // Role state
  CasualStatus roleClientListStatus;
  List<RoleModel> roleClientList;
  CasualStatus roleProgrammerListStatus;
  List<RoleModel> roleProgrammerList;

  AuthState(
      {this.masseage = "",
      this.userModel,
      this.userModelStatus = CasualStatus.initial,
      this.clientProfileStatus = CasualStatus.initial,
      this.programmerProfileStatus = CasualStatus.initial,
      this.roleClientListStatus = CasualStatus.initial,
      this.roleClientList = const [],
      this.roleProgrammerListStatus = CasualStatus.initial,
      this.roleProgrammerList = const []});

  AuthState copyWith({
    String? masseage,
    CasualStatus? userModelStatus,
    UserModel? userModel,
    CasualStatus? clientProfileStatus,
    CasualStatus? programmerProfileStatus,
    CasualStatus? roleClientListStatus,
    List<RoleModel>? roleClientList,
    CasualStatus? roleProgrammerListStatus,
    List<RoleModel>? roleProgrammerList,
  }) {
    return AuthState(
      masseage: masseage ?? this.masseage,
      userModelStatus: userModelStatus ?? this.userModelStatus,
      userModel: userModel ?? this.userModel,
      clientProfileStatus: clientProfileStatus ?? this.clientProfileStatus,
      programmerProfileStatus:
          programmerProfileStatus ?? this.programmerProfileStatus,
      roleClientListStatus: roleClientListStatus ?? this.roleClientListStatus,
      roleClientList: roleClientList ?? this.roleClientList,
      roleProgrammerListStatus:
          roleProgrammerListStatus ?? this.roleProgrammerListStatus,
      roleProgrammerList: roleProgrammerList ?? this.roleProgrammerList,
    );
  }
}
