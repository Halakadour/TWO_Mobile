import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/param/task_param.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/task/domain/entity/task_entity.dart';
import 'package:two_mobile/features/task/domain/repos/task_repo.dart';

class ShowMyProjectTasksUsecase extends UseCase<
    Future<Either<Failure, List<TaskEntity>>>, ShowMyProjectTasksParam> {
  ShowMyProjectTasksUsecase(this.taskRepo);
  final TaskRepo taskRepo;

  @override
  Future<Either<Failure, List<TaskEntity>>> call(
    ShowMyProjectTasksParam param,
  ) {
    return taskRepo.showMyProjectTasks(param);
  }
}
