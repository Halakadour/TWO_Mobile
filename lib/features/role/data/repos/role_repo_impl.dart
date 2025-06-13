import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/network/network_connection_checker.dart';
import 'package:two_mobile/features/role/data/datasources/role_local_datasource.dart';
import 'package:two_mobile/features/role/data/datasources/role_remote_datasource.dart';
import 'package:two_mobile/features/role/data/models/role_response_model.dart';
import 'package:two_mobile/features/role/domain/repos/role_repo.dart';

class RoleRepoImpl extends RoleRepo {
  final RoleLocalDatasource roleLocalDatasource;
  final RoleRemoteDatasource roleRemoteDatasource;
  final NetworkInfo networkInfo;

  RoleRepoImpl(
    this.roleLocalDatasource,
    this.roleRemoteDatasource,
    this.networkInfo,
  );
  @override
  Future<Either<Failure, RoleResponesModel>> showClientRole() {
    return wrapHandling(
      tryCall: () async {
        final remoteRoles = await roleRemoteDatasource.showClientRole();
        return Right(remoteRoles);
      },
    );
  }

  @override
  Future<Either<Failure, RoleResponesModel>> showProgrammerRole() {
    return wrapHandling(
      tryCall: () async {
        final remoteRoles = await roleRemoteDatasource.showProgrammerRole();
        return Right(remoteRoles);
        // if (await networkInfo.isConnected) {
        //   final remoteRoles = await roleRemoteDatasource.showProgrammerRole();
        //   roleLocalDatasource.cacheRoles(remoteRoles.data);
        //   return Right(remoteRoles);
        // } else {
        //   final localRoles = await roleLocalDatasource.getCachedRoles();
        //   return Right(
        //     RoleResponesModel(status: 200, msg: "Local", data: localRoles),
        //   );
        // }
      },
    );
  }
}
