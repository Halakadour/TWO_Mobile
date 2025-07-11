import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/param/casule_param.dart';
import 'package:two_mobile/core/param/status_param.dart';
import 'package:two_mobile/features/status/data/datasource/status_remote_data_source.dart';
import 'package:two_mobile/features/status/data/models/status_model.dart';
import 'package:two_mobile/features/status/domain/repo/status_repo.dart';

class StatusRepoImpl extends StatusRepo {
  final StatusRemoteDataSource statusRemoteDataSource;

  StatusRepoImpl(this.statusRemoteDataSource);
  @override
  Future<Either<Failure, Unit>> createStatus(CreateStatusParam param) {
    return wrapHandling(
      tryCall: () async {
        statusRemoteDataSource.createStatus(param);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteStatus(DeleteStatusParam param) {
    return wrapHandling(
      tryCall: () async {
        statusRemoteDataSource.deleteStatus(param);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, List<StatusModel>>> showStatus(
    TokenWithIdParam project,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await statusRemoteDataSource.showStatus(project);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> updateStatusOrder(
    UpdateStatusOrderParam param,
  ) {
    return wrapHandling(
      tryCall: () async {
        statusRemoteDataSource.updateStatusOrder(param);
        return const Right(unit);
      },
    );
  }
}
