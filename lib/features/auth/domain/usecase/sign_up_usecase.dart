import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/usecase/usecase.dart';
import 'package:two_mobile/features/auth/data/models/sign_up_response_model.dart';
import 'package:two_mobile/features/auth/domain/repo/auth_repo.dart';

class SignUpUsecase extends Usecase<
    Future<Either<Failure, SignupResponseModel>>, SignUpParams> {
  final AuthRepo authRepo;

  SignUpUsecase({required this.authRepo});

  @override
  Future<Either<Failure, SignupResponseModel>> call(SignUpParams param) {
    return authRepo.signup(
        param.name, param.email, param.password, param.passwordConfirmation);
  }
}

class SignUpParams {
  String name;
  String email;
  String password;
  String passwordConfirmation;
  SignUpParams(
      {required this.name,
      required this.email,
      required this.password,
      required this.passwordConfirmation});
}
