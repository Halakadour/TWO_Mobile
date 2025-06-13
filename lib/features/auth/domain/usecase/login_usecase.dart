import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/usecase/usecase.dart';
import 'package:two_mobile/features/auth/data/models/login_response_model.dart';
import 'package:two_mobile/features/auth/domain/repo/auth_repo.dart';

class LoginUsecase
    extends Usecase<Future<Either<Failure, LoginResponseModel>>, LoginParams> {
  final AuthRepo authRepo;
  LoginUsecase({required this.authRepo});
  @override
  Future<Either<Failure, LoginResponseModel>> call(LoginParams param) {
    return authRepo.login(param.email, param.password);
  }
}

class LoginParams {
  String email;
  String password;
  LoginParams({required this.email, required this.password});
}
