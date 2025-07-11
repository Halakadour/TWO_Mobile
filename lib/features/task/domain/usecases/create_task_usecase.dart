import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/param/task_param.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/task/domain/repos/task_repo.dart';

class CreateTaskUsecase
    extends UseCase<Future<Either<Failure, Unit>>, CreateOrUpdateTaskParam> {
  CreateTaskUsecase(this.taskRepo);
  final TaskRepo taskRepo;

  @override
  Future<Either<Failure, Unit>> call(CreateOrUpdateTaskParam param) {
    return taskRepo.createTask(param);
  }
}
