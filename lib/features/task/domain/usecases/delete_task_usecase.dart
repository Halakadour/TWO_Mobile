import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/param/casule_param.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/task/domain/repos/task_repo.dart';

class DeleteTaskUsecase
    extends UseCase<Future<Either<Failure, Unit>>, TokenWithIdParam> {
  DeleteTaskUsecase(this.taskRepo);
  final TaskRepo taskRepo;

  @override
  Future<Either<Failure, Unit>> call(TokenWithIdParam param) {
    return taskRepo.deleteTask(param);
  }
}
