import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/api/failures.dart';
import 'package:two_mobile/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:two_mobile/features/auth/data/models/login_response_model.dart';
import 'package:two_mobile/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepoImpl({required this.authRemoteDatasource});
  @override
  Future<Either<Failure, LoginResponseModel>> login(
      String email, String password) {
    return wrapHandling(
      tryCall: () async {
        final result = await authRemoteDatasource.login(email, password);
        return Right(result);
      },
    );
  }
}
