import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:two_mobile/core/network/enums.dart';
import 'package:two_mobile/features/auth/data/models/login_response_model.dart';
import 'package:two_mobile/features/auth/domain/usecase/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<LoginEvent, AuthState> {
  final LoginUsecase loginUsecase;

  AuthBloc({required this.loginUsecase}) : super(AuthState()) {
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(authModelStatus: CasualStatus.loading));
      final result = await loginUsecase
          .call(LoginParams(email: event.email, password: event.password));
      result.fold((left) {
        emit(state.copyWith(authModelStatus: CasualStatus.failure));
      }, (right) {
        emit(state.copyWith(
            userModel: right.data, authModelStatus: CasualStatus.success));
      });
    });
  }
}
