import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/api/failures.dart';
import 'package:two_mobile/core/network/network_connection_checker.dart';
import 'package:two_mobile/features/auth/role/data/datasource/role_local_datasource.dart';
import 'package:two_mobile/features/auth/role/data/datasource/role_remote_datasource.dart';
import 'package:two_mobile/features/auth/role/data/models/role_model.dart';
import 'package:two_mobile/features/auth/role/domain/repos/role_repo.dart';

class RoleRepoImpl extends RoleRepo {
  final RoleLocalDatasource roleLocalDatasource;
  final RoleRemoteDatasource roleRemoteDatasource;
  final NetworkInfo networkInfo;

  RoleRepoImpl(
      {required this.roleLocalDatasource,
      required this.roleRemoteDatasource,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<RoleModel>>> getCleintRole() {
    return wrapHandling(
      tryCall: () async {
        if (await networkInfo.isConnected) {
          final roleRemoteList = await roleRemoteDatasource.showClientRole();
          roleLocalDatasource.cacheRoles(roleRemoteList.data);
          return Right(roleRemoteList.data);
        } else {
          final roleLocaleList = await roleLocalDatasource.getCachedRoles();
          return Right(roleLocaleList);
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<RoleModel>>> getProgrmmerRole() {
    // TODO: implement getProgrmmerRole
    throw UnimplementedError();
  }
}
