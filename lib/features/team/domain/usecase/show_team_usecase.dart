import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/usecases/no_param_usecase.dart';
import 'package:two_mobile/features/team/data/model/team_model.dart';
import 'package:two_mobile/features/team/domain/repo/team_repo.dart';

class ShowTeamUsecase
    extends NoParamUsecase<Future<Either<Failure, List<TeamModel>>>> {
  final TeamRepo teamRepo;

  ShowTeamUsecase({required this.teamRepo});
  @override
  Future<Either<Failure, List<TeamModel>>> call() {
    return teamRepo.showTeam();
  }
}
