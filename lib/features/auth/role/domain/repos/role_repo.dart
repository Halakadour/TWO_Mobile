import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/error/handling_exception_manager.dart';
import 'package:two_mobile/features/auth/role/data/models/role_model.dart';

abstract class RoleRepo with HandlingExceptionManager {
  Future<Either<Failure, List<RoleModel>>> getCleintRole();
  Future<Either<Failure, List<RoleModel>>> getProgrmmerRole();
}
