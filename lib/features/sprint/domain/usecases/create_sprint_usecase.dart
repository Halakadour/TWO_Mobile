import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/param/sprint_param.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/sprint/domain/repos/sprint_repo.dart';

class CreateSprintUsecase
    extends UseCase<Future<Either<Failure, Unit>>, CreateOrUpdateSprintParam> {
  CreateSprintUsecase(this.sprintRepo);
  final SprintRepo sprintRepo;

  @override
  Future<Either<Failure, Unit>> call(CreateOrUpdateSprintParam param) {
    return sprintRepo.createSprint(param);
  }
}
