import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/error/handling_exception_manager.dart';
import 'package:two_mobile/features/projects/data/model/show_all_project-response_model.dart';
import 'package:two_mobile/features/projects/data/model/show_my_project_response_model.dart';

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

  // Specify Project Team
  Future<Either<Failure, Unit>> specifyProjectTeam(
    String projectId,
    String teamId,
    String token,
  );

  // show all project
  Future<Either<Failure, List<ProjectModel>>> showAllProject(String token);

  // show my project
  Future<Either<Failure, List<MyProjectModel>>> showMyPorject(String token);
}
