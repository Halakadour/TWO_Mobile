// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/role/data/models/employee_model.dart';
import 'package:two_mobile/features/role/domain/repos/role_repo.dart';

class ShowUsersUsecase extends UseCase<
    Future<Either<Failure, List<EmployeeModel>>>, ShowUsersParam> {
  final RoleRepo roleRepo;

  ShowUsersUsecase(this.roleRepo);
  @override
  Future<Either<Failure, List<EmployeeModel>>> call(ShowUsersParam param) {
    return roleRepo.showUsersWithFilter(
      param.roleFilter,
      param.token,
    );
  }
}

class ShowUsersParam {
  int? roleFilter;
  String token;
  ShowUsersParam({
    required this.roleFilter,
    required this.token,
  });
}
