import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/param/casule_param.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/sprint/data/models/sprint.dart';
import 'package:two_mobile/features/task/domain/repos/task_repo.dart';

class ShowPendingSprintTasksUsecase
    extends UseCase<Future<Either<Failure, List<Sprint>>>, TokenWithIdParam> {
  final TaskRepo taskRepo;

  ShowPendingSprintTasksUsecase(this.taskRepo);

  @override
  Future<Either<Failure, List<Sprint>>> call(TokenWithIdParam param) {
    return taskRepo.showPenedingSprintsTasks(param);
  }
}
