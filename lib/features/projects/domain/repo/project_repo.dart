import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/error/handling_exception_manager.dart';

abstract class ProjectRepo with HandlingExceptionManager {
  // update project
  Future<Either<Failure, Unit>> updateProject(
    String flullName,
    String companyName,
    String email,
    String phone,
    String projectType,
    String projectDescraption,
    String cost,
    String duration,
    String requirements,
    String document,
    String cooperationType,
    String contactTime,
    String private,
    String projectId,
    String token,
  );
}
