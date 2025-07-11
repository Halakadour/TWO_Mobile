import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/error/handling_exception_manager.dart';
import 'package:two_mobile/core/param/casule_param.dart';
import 'package:two_mobile/core/param/sprint_param.dart';
import 'package:two_mobile/features/sprint/domain/entity/sprint_entity.dart';

abstract class SprintRepo with HandlingExceptionManager {
  Future<Either<Failure, Unit>> createSprint(CreateOrUpdateSprintParam param);
  Future<Either<Failure, Unit>> updateSprint(CreateOrUpdateSprintParam param);
  Future<Either<Failure, Unit>> deleteSprint(TokenWithIdParam sprint);
  Future<Either<Failure, Unit>> startSprint(StartSprintParam param);
  Future<Either<Failure, Unit>> completeSprint(CompleteSprintParam param);
  Future<Either<Failure, List<SprintEntity>>> showProjectUnCompleteSprints(
    TokenWithIdParam project,
  );
  Future<Either<Failure, List<SprintEntity>>> showProjectStartedSprints(
    TokenWithIdParam project,
  );

  Future<Either<Failure, List<SprintEntity>>> showProjectSprints(
    TokenWithIdParam project,
  );
  Future<Either<Failure, SprintEntity>> showSprintDetails(
    TokenWithIdParam sprint,
  );
}
