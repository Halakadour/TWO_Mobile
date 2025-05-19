import 'package:bloc/bloc.dart';
import 'package:two_mobile/core/network/enums.dart';
import 'package:two_mobile/core/services/shared_preferences_services.dart';
import 'package:two_mobile/features/auth/data/models/login_response_model.dart';
import 'package:two_mobile/features/auth/data/models/update_client_prfile_response_model.dart';
import 'package:two_mobile/features/auth/domain/usecase/login_usecase.dart';
import 'package:two_mobile/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:two_mobile/features/auth/domain/usecase/update_client_profile_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //login
  final LoginUsecase loginUsecase;
  //sign up
  final SignUpUsecase signUpUsecase;
  // update client profile
  final UpdateClientProfileUsecase updateClientProfileUsecase;

  AuthBloc({
    required this.signUpUsecase,
    required this.loginUsecase,
    required this.updateClientProfileUsecase,
  }) : super(AuthState()) {
    // login
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(authModelStatus: CasualStatus.loading));
      final result = await loginUsecase
          .call(LoginParams(email: event.email, password: event.password));
      result.fold((left) {
        emit(state.copyWith(
            authModelStatus: CasualStatus.failure, masseage: left.message));
      }, (right) {
        emit(state.copyWith(
            userModel: right.data, authModelStatus: CasualStatus.success));
      });
    });
    // Sign Up
    on<SignUpEvent>((event, emit) async {
      emit(state.copyWith(authModelStatus: CasualStatus.loading));
      final result = await signUpUsecase.call(SignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
        passwordConfirmation: event.passwordConfirmation,
      ));
      result.fold((left) {
        emit(state.copyWith(
            authModelStatus: CasualStatus.failure, masseage: left.message));
      }, (right) {
        emit(state.copyWith(
            userModel: right.data, authModelStatus: CasualStatus.success));
      });
    });
    // update client profile
    on<UpdateClientProfileEvent>((event, emit) async {
      emit(state.copyWith(clientprofileStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await updateClientProfileUsecase.call(
            UpdateClientProfileParams(
                roleid: event.roleid,
                image: event.image,
                subject: event.subject,
                phone: event.phone,
                token: token));
        result.fold(
          (left) {
            emit(state.copyWith(
                clientprofileStatus: CasualStatus.failure,
                masseage: left.message));
          },
          (right) {
            emit(
              state.copyWith(clientprofileStatus: CasualStatus.success),
            );
          },
        );
      } else {
        emit(state.copyWith(clientprofileStatus: CasualStatus.noToken));
      }
    });
  }
}
