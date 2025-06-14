import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/error/handling_exception_manager.dart';
import 'package:two_mobile/features/auth/data/models/login_response_model.dart';
import 'package:two_mobile/features/auth/data/models/sign_up_response_model.dart';
import 'package:two_mobile/features/auth/data/models/update_client_prfile_response_model.dart';
import 'package:two_mobile/features/auth/data/models/update_programmer_profile_response_model.dart';

abstract class AuthRepo with HandlingExceptionManager {
  // login
  Future<Either<Failure, LoginResponseModel>> login(
    String email,
    String password,
  );
// sign up
  Future<Either<Failure, SignupResponseModel>> signup(
    String name,
    String email,
    String password,
    String passwordConfirmation,
  );
  // update client profile
  Future<Either<Failure, UpdateClientProfileResponseModel>> cleintUpdateProfile(
    String token,
    String roleid,
    String image,
  );
  // update programmer profile
  Future<Either<Failure, UpdateEmployeeProfileResponseModel>>
      programmerUpdateProfile(
    String token,
    String image,
    String cv,
    String roleId,
  );
}
