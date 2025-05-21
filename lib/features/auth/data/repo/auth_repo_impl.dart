import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/api/failures.dart';
import 'package:two_mobile/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:two_mobile/features/auth/data/models/login_response_model.dart';
import 'package:two_mobile/features/auth/data/models/sign_up_response_model.dart';
import 'package:two_mobile/features/auth/data/models/update_client_prfile_response_model.dart';
import 'package:two_mobile/features/auth/data/models/update_programmer_profile_response_model.dart';
import 'package:two_mobile/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepoImpl({required this.authRemoteDatasource});
  // login
  @override
  Future<Either<Failure, LoginResponseModel>> login(
    String email,
    String password,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await authRemoteDatasource.login(
          email,
          password,
        );
        return Right(result);
      },
    );
  }
  // sign up

  @override
  Future<Either<Failure, SignupResponseModel>> signup(
    String name,
    String email,
    String password,
    String passwordConfirmation,
  ) {
    return wrapHandling(tryCall: () async {
      final result = await authRemoteDatasource.signup(
        name,
        email,
        password,
        passwordConfirmation,
      );
      return Right(result);
    });
  }

// update client profile
  @override
  Future<Either<Failure, UpdateClientProfileResponseModel>> cleintUpdateProfile(
    String roleid,
    String image,
    String token,
  ) {
    return wrapHandling(tryCall: () async {
      final result = await authRemoteDatasource.cleintUpdateProfile(
        roleid,
        image,
        token,
      );
      return Right(result);
    });
  }

  // update programmer profile
  @override
  Future<Either<Failure, UpdateEmployeeProfileResponseModel>>
      programmerUpdateProfile(
    String token,
    String image,
    String cv,
    String roleId,
  ) {
    return wrapHandling(tryCall: () async {
      final result = await authRemoteDatasource.programmerUpdateProfile(
        token,
        image,
        cv,
        roleId,
      );
      return Right(result);
    });
  }
}
