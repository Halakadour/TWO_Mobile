import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/usecase/no_param_usecase.dart';
import 'package:two_mobile/features/team/domain/entity/team_entity.dart';
import 'package:two_mobile/features/team/domain/repo/team_repo.dart';

class ShowTeamUsecase
    extends NoParamUsecase<Future<Either<Failure, List<TeamEntity>>>> {
  final TeamRepo teamRepo;

  ShowTeamUsecase({required this.teamRepo});
  @override
  Future<Either<Failure, List<TeamEntity>>> call() {
    return teamRepo.showTeam();
  }
}
