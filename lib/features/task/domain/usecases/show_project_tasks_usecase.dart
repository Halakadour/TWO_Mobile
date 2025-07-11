import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/param/casule_param.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/task/domain/entity/task_entity.dart';
import 'package:two_mobile/features/task/domain/repos/task_repo.dart';

class ShowProjectTasksUsecase extends UseCase<
    Future<Either<Failure, List<TaskEntity>>>, TokenWithIdParam> {
  final TaskRepo taskRepo;

  ShowProjectTasksUsecase(this.taskRepo);

  @override
  Future<Either<Failure, List<TaskEntity>>> call(TokenWithIdParam param) {
    return taskRepo.showProjectTasks(param);
  }
}
