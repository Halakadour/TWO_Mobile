import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/usecases/no_param_usecase.dart';
import 'package:two_mobile/features/role/data/models/role_response_model.dart';
import 'package:two_mobile/features/role/domain/repos/role_repo.dart';

class ShowClientRoleUsecase
    extends NoParamUsecase<Future<Either<Failure, RoleResponesModel>>> {
  final RoleRepo roleRepo;

  ShowClientRoleUsecase(this.roleRepo);

  @override
  Future<Either<Failure, RoleResponesModel>> call() {
    return roleRepo.showClientRole();
  }
}
