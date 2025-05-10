import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/api/failures.dart';
import 'package:two_mobile/core/api/handling_exception_manager.dart';
import 'package:two_mobile/features/auth/data/datasource/sign_remote_datasource.dart';
import 'package:two_mobile/features/auth/data/models/sign_up_response_model.dart';

abstract class SignUpRepo with HandlingExceptionManager {
  Future<Either<Failure, SignupResponseModel>> signup(
      String name, String email, String password, String passwordConfirmation) {
    return wrapHandling(tryCall: () async {
      final result = await SignupremoteDatasourceImpl()
          .signup(name, email, password, passwordConfirmation);
      return Right(result);
    });
  }
}
