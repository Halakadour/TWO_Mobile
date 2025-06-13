import 'package:bloc/bloc.dart';
import 'package:two_mobile/core/network/enums.dart';
import 'package:two_mobile/core/services/shared_preferences_services.dart';
import 'package:two_mobile/features/auth/data/models/login_response_model.dart';
import 'package:two_mobile/features/auth/domain/usecase/login_usecase.dart';
import 'package:two_mobile/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:two_mobile/features/auth/domain/usecase/update_client_profile_usecase.dart';
import 'package:two_mobile/features/auth/domain/usecase/update_programmer_profile_usecase.dart';
import 'package:two_mobile/features/role/data/models/role_response_model.dart';
import 'package:two_mobile/features/role/domain/usecases/show_role_client_usecase.dart';
import 'package:two_mobile/features/role/domain/usecases/show_roles_without_client_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //login
  final LoginUsecase loginUsecase;
  //sign up
  final SignUpUsecase signUpUsecase;
  // update client profile
  final UpdateClientProfileUsecase updateClientProfileUsecase;
  // Update programmer profile
  final UpdateProgrammerProfileUsecase updateProgrammerProfileUsecase;
  // show client role
  final ShowClientRoleUsecase showClientRoleUsecase;
  final ShowProgrammerRoleUsecase showProgrammerRoleUsecase;

  AuthBloc(
      {required this.signUpUsecase,
      required this.loginUsecase,
      required this.updateClientProfileUsecase,
      required this.updateProgrammerProfileUsecase,
      required this.showClientRoleUsecase,
      required this.showProgrammerRoleUsecase})
      : super(AuthState()) {
    // login
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(userModelStatus: CasualStatus.loading));
      final result = await loginUsecase
          .call(LoginParams(email: event.email, password: event.password));
      result.fold((left) {
        emit(state.copyWith(
            userModelStatus: CasualStatus.failure, masseage: left.message));
      }, (right) {
        emit(state.copyWith(
            userModel: right.data, userModelStatus: CasualStatus.success));
      });
    });
    // Sign Up
    on<SignUpEvent>((event, emit) async {
      emit(state.copyWith(userModelStatus: CasualStatus.loading));
      final result = await signUpUsecase.call(SignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
        passwordConfirmation: event.passwordConfirmation,
      ));
      result.fold((left) {
        emit(state.copyWith(
            userModelStatus: CasualStatus.failure, masseage: left.message));
      }, (right) {
        emit(state.copyWith(
            userModel: right.data, userModelStatus: CasualStatus.success));
      });
    });
    // update client profile
    on<UpdateClientProfileEvent>((event, emit) async {
      print("IsLoading");
      emit(state.copyWith(clientProfileStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await updateClientProfileUsecase.call(
            UpdateClientProfileParams(
                roleid: event.roleid, image: event.image, token: token));
        result.fold(
          (left) {
            emit(state.copyWith(
                clientProfileStatus: CasualStatus.failure,
                masseage: left.message));
          },
          (right) {
            emit(
              state.copyWith(clientProfileStatus: CasualStatus.success),
            );
          },
        );
      } else {
        emit(state.copyWith(clientProfileStatus: CasualStatus.noToken));
      }
    });
    // update programmer profile
    on<UpdateProgrammerProfileEvent>((event, emit) async {
      emit(state.copyWith(programmerProfileStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await updateProgrammerProfileUsecase.call(
            UpdateProgrammerParams(
                token: token,
                image: event.image,
                cv: event.cv,
                roleId: event.roleId));
        result.fold(
          (left) {
            emit(state.copyWith(
                programmerProfileStatus: CasualStatus.failure,
                masseage: left.message));
          },
          (right) {
            emit(
              state.copyWith(programmerProfileStatus: CasualStatus.success),
            );
          },
        );
      } else {
        emit(state.copyWith(programmerProfileStatus: CasualStatus.noToken));
      }
    });
    // Get Client Role
    on<GetClientRoleEvent>((event, emit) async {
      emit(state.copyWith(roleClientListStatus: CasualStatus.loading));
      final result = await showClientRoleUsecase.call();
      result.fold(
        (left) {
          emit(state.copyWith(
              roleClientListStatus: CasualStatus.failure,
              masseage: left.message));
        },
        (right) {
          emit(
            state.copyWith(
                roleClientListStatus: CasualStatus.success,
                roleClientList: right.data),
          );
        },
      );
    });
    // Get Programmer Role
    on<GetProgrammerRoleEvent>((event, emit) async {
      emit(state.copyWith(roleProgrammerListStatus: CasualStatus.loading));
      final result = await showProgrammerRoleUsecase.call();
      result.fold(
        (left) {
          emit(state.copyWith(
              roleProgrammerListStatus: CasualStatus.failure,
              masseage: left.message));
        },
        (right) {
          emit(
            state.copyWith(
                roleProgrammerListStatus: CasualStatus.success,
                roleProgrammerList: right.data),
          );
        },
      );
    });
  }
}
