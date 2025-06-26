import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/features/projects/data/database/project_datasource.dart';
import 'package:two_mobile/features/projects/data/model/show_all_project-response_model.dart';
import 'package:two_mobile/features/projects/data/model/show_my_project_response_model.dart';
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
    String token,
  ) {
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

// Specify Project Team
  @override
  Future<Either<Failure, Unit>> specifyProjectTeam(
    String projectId,
    String teamId,
    String token,
  ) {
    return wrapHandling(tryCall: () async {
      await projectDatasource.specifyProjectTeam(
        projectId,
        teamId,
        token,
      );
      return const Right(unit);
    });
  }

// show all project
  @override
  Future<Either<Failure, List<ProjectModel>>> showAllProject(String token) {
    return wrapHandling(tryCall: () async {
      await projectDatasource.showAllProject(token);
      final result = await projectDatasource.showAllProject(token);
      return Right(result.data);
    });
  }

  // show my project
 
  @override
  Future<Either<Failure, List<MyProjectModel>>> showMyPorject(String token) {
  return wrapHandling(tryCall: () async {
      await projectDatasource.showMyProject(token);
      final result =  await projectDatasource.showMyProject(token); 
      return  Right(result.data);
    });
  }
}
