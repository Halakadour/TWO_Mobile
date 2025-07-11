import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/param/casule_param.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/sprint/domain/entity/sprint_entity.dart';
import 'package:two_mobile/features/sprint/domain/repos/sprint_repo.dart';

class ShowSprintDetailsUsecase
    extends UseCase<Future<Either<Failure, SprintEntity>>, TokenWithIdParam> {
  ShowSprintDetailsUsecase(this.sprintRepo);
  final SprintRepo sprintRepo;

  @override
  Future<Either<Failure, SprintEntity>> call(TokenWithIdParam param) {
    return sprintRepo.showSprintDetails(param);
  }
}
