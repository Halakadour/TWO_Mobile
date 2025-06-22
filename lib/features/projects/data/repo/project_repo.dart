import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/features/projects/data/database/project_datasource.dart';
import 'package:two_mobile/features/projects/domain/repo/project_repo.dart';

class ProjectRepoImpl extends ProjectRepo {
  // update project
  final ProjectDatasource projectDatasource;

  ProjectRepoImpl({required this.projectDatasource});
  @override
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
      String token) {
    return wrapHandling(tryCall: () async {
      await projectDatasource.updateProject(
        flullName,
        companyName,
        email,
        phone,
        projectType,
        projectDescraption,
        cost,
        duration,
        requirements,
        document,
        cooperationType,
        contactTime,
        private,
        projectId,
        token,
      );
      return const Right(unit);
    });
  }
}
