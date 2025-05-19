import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/api/failures.dart';
import 'package:two_mobile/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:two_mobile/features/auth/data/models/login_response_model.dart';
import 'package:two_mobile/features/auth/data/models/sign_up_response_model.dart';
import 'package:two_mobile/features/auth/data/models/update_client_prfile_response_model.dart';
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

  @override
  Future<Either<Failure, SignupResponseModel>> signup(
      String name, String email, String password, String passwordConfirmation) {
    return wrapHandling(tryCall: () async {
      final result = await authRemoteDatasource.signup(
          name, email, password, passwordConfirmation);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, UpdateClientProfileResponseModel>> cleintupdateprofile(
      String roleid, String image, String subject, String phone, String token) {
    return wrapHandling(tryCall: () async {
      final result = await authRemoteDatasource.cleintupdateprofile(
          roleid, image, subject, phone, token);
      return Right(result);
    });
  }
}
