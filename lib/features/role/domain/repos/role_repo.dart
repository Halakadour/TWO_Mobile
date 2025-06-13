import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/error/handling_exception_manager.dart';
import 'package:two_mobile/features/role/data/models/role_response_model.dart';

abstract class RoleRepo with HandlingExceptionManager {
  Future<Either<Failure, RoleResponesModel>> showProgrammerRole();
  Future<Either<Failure, RoleResponesModel>> showClientRole();
}
