import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/param/casule_param.dart';
import 'package:two_mobile/core/param/sprint_param.dart';
import 'package:two_mobile/features/sprint/data/datasource/sprints_remote_datasource.dart';
import 'package:two_mobile/features/sprint/domain/entity/sprint_entity.dart';
import 'package:two_mobile/features/sprint/domain/repos/sprint_repo.dart';

class SprintRepoImpl extends SprintRepo {
  SprintRepoImpl(this.sprintsRemoteDatasource);

  final SprintsRemoteDatasource sprintsRemoteDatasource;
  @override
  Future<Either<Failure, Unit>> createSprint(CreateOrUpdateSprintParam param) {
    return wrapHandling(
      tryCall: () async {
        sprintsRemoteDatasource.createSprint(param);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteSprint(TokenWithIdParam sprint) {
    return wrapHandling(
      tryCall: () async {
        sprintsRemoteDatasource.deleteSprint(sprint);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, List<SprintEntity>>> showProjectSprints(
    TokenWithIdParam project,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await sprintsRemoteDatasource.showProjectSprints(
          project,
        );
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, SprintEntity>> showSprintDetails(
    TokenWithIdParam sprint,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await sprintsRemoteDatasource.showSprintDetails(sprint);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> updateSprint(CreateOrUpdateSprintParam param) {
    return wrapHandling(
      tryCall: () async {
        await sprintsRemoteDatasource.updateSprint(param);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> completeSprint(CompleteSprintParam param) {
    return wrapHandling(
      tryCall: () async {
        await sprintsRemoteDatasource.completeSprint(param);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, List<SprintEntity>>> showProjectStartedSprints(
    TokenWithIdParam project,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await sprintsRemoteDatasource.showProjectStartedSprints(
          project,
        );
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<SprintEntity>>> showProjectUnCompleteSprints(
    TokenWithIdParam project,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result =
            await sprintsRemoteDatasource.showProjectUnCompleteSprints(project);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> startSprint(StartSprintParam param) {
    return wrapHandling(
      tryCall: () async {
        await sprintsRemoteDatasource.startSprint(param);
        return const Right(unit);
      },
    );
  }
}
