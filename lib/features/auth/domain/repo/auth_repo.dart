import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/api/failures.dart';
import 'package:two_mobile/core/api/handling_exception_manager.dart';
import 'package:two_mobile/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:two_mobile/features/auth/data/models/login_response_model.dart';

abstract class AuthRepo with HandlingExceptionManager {
  Future<Either<Failure, LoginResponseModel>> login(
      String email, String password) {
    return wrapHandling(tryCall: () async {
      final result = await AuthRemoteDatasourceImpl().login(email, password);
      return Right(result);
    });
  }
}
