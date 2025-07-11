import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/projects/domain/repo/project_repo.dart';

class SpecifyProjectTeamUsecase extends UseCase<Future<Either<Failure, Unit>>,
    SpecifyProjectTeamParameters> {
  final ProjectRepo projectRepo;

  SpecifyProjectTeamUsecase({required this.projectRepo});
  @override
  Future<Either<Failure, Unit>> call(SpecifyProjectTeamParameters param) {
    return projectRepo.specifyProjectTeam(
      param.projectId,
      param.teamId,
      param.token,
    );
  }
}

class SpecifyProjectTeamParameters {
  String projectId;
  String teamId;
  String token;
  SpecifyProjectTeamParameters({
    required this.projectId,
    required this.teamId,
    required this.token,
  });
}
