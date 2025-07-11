import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';

import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/projects/data/model/project_model.dart';
import 'package:two_mobile/features/projects/domain/repo/project_repo.dart';

class ShowAllProjectUsecase
    extends UseCase<Future<Either<Failure, List<ProjectModel>>>, String> {
  final ProjectRepo projectRepo;

  ShowAllProjectUsecase({required this.projectRepo});
  @override
  Future<Either<Failure, List<ProjectModel>>> call(String param) {
    return projectRepo.showAllProject(param);
  }
}
