import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/param/casule_param.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/sprint/domain/repos/sprint_repo.dart';

class DeleteSprintUsecase
    extends UseCase<Future<Either<Failure, Unit>>, TokenWithIdParam> {
  DeleteSprintUsecase(this.sprintRepo);
  final SprintRepo sprintRepo;

  @override
  Future<Either<Failure, Unit>> call(TokenWithIdParam param) {
    return sprintRepo.deleteSprint(param);
  }
}
