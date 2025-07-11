import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/param/task_param.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/task/domain/repos/task_repo.dart';

class CreateBacklogTasksUsecase extends UseCase<Future<Either<Failure, Unit>>,
    CreateBacklogTasksSprintParam> {
  final TaskRepo taskRepo;

  CreateBacklogTasksUsecase(this.taskRepo);

  @override
  Future<Either<Failure, Unit>> call(CreateBacklogTasksSprintParam param) {
    return taskRepo.createBacklogTasksSprint(param);
  }
}
