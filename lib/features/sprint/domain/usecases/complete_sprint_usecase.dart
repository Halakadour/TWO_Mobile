import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/param/sprint_param.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/sprint/domain/repos/sprint_repo.dart';

class CompleteSprintUsecase
    extends UseCase<Future<Either<Failure, Unit>>, CompleteSprintParam> {
  final SprintRepo sprintRepo;

  CompleteSprintUsecase(this.sprintRepo);

  @override
  Future<Either<Failure, Unit>> call(CompleteSprintParam param) {
    return sprintRepo.completeSprint(param);
  }
}
