import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/param/casule_param.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/task/domain/entity/task_entity.dart';
import 'package:two_mobile/features/task/domain/repos/task_repo.dart';

class ShowTaskDetailsUsecase
    extends UseCase<Future<Either<Failure, TaskEntity>>, TokenWithIdParam> {
  ShowTaskDetailsUsecase(this.taskRepo);
  final TaskRepo taskRepo;

  @override
  Future<Either<Failure, TaskEntity>> call(TokenWithIdParam param) {
    return taskRepo.showTaskDetails(param);
  }
}
