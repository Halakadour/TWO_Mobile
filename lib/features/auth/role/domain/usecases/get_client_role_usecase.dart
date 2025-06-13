import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/usecase/no_param_usecase.dart';
import 'package:two_mobile/features/auth/role/data/models/role_model.dart';
import 'package:two_mobile/features/auth/role/domain/repos/role_repo.dart';

class GetClientRoleUsecase
    extends NoParamUsecase<Future<Either<Failure, List<RoleModel>>>> {
  final RoleRepo roleRepo;

  GetClientRoleUsecase({required this.roleRepo});

  @override
  Future<Either<Failure, List<RoleModel>>> call() {
    return roleRepo.getCleintRole();
  }
}
