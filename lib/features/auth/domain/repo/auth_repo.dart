import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/api/failures.dart';
import 'package:two_mobile/core/api/handling_exception_manager.dart';
import 'package:two_mobile/features/auth/data/models/login_response_model.dart';
import 'package:two_mobile/features/auth/data/models/sign_up_response_model.dart';

abstract class AuthRepo with HandlingExceptionManager {
  Future<Either<Failure, LoginResponseModel>> login(
      String email, String password);

  Future<Either<Failure, SignupResponseModel>> signup(
      String name, String email, String password, String passwordConfirmation);
}
