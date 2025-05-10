import 'package:bloc/bloc.dart';
import 'package:two_mobile/core/network/enums.dart';
import 'package:two_mobile/features/auth/data/models/login_response_model.dart';
import 'package:two_mobile/features/auth/data/models/sign_up_response_model.dart';
import 'package:two_mobile/features/auth/domain/usecase/login_usecase.dart';
import 'package:two_mobile/features/auth/domain/usecase/sign_up_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //login
  final LoginUsecase loginUsecase;
  //sign up
  final SignUpUsecase signUpUsecase;

  AuthBloc({required this.signUpUsecase, required this.loginUsecase})
      : super(AuthState()) {
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
            signUpModel: right.data, authModelStatus: CasualStatus.success));
      });
    });
  }
}
