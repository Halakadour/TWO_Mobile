import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/param/task_param.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/status/data/models/status_model.dart';
import 'package:two_mobile/features/task/domain/repos/task_repo.dart';

class ShowProjectBoardUsecase extends UseCase<
    Future<Either<Failure, List<StatusModel>>>, ShowProjectBoardParam> {
  final TaskRepo taskRepo;

  ShowProjectBoardUsecase(this.taskRepo);

  @override
  Future<Either<Failure, List<StatusModel>>> call(ShowProjectBoardParam param) {
    return taskRepo.showProjectBoard(param);
  }
}
