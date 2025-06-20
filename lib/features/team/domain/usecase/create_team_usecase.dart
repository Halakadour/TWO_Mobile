import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/usecase/usecase.dart';
import 'package:two_mobile/features/team/domain/repo/team_repo.dart';

class CreateTeamUsecase
    extends Usecase<Future<Either<Failure, Unit>>, CreateTeamParams> {
  final TeamRepo teamRepo;
  CreateTeamUsecase({required this.teamRepo});

  @override
  Future<Either<Failure, Unit>> call(CreateTeamParams param) {
    return teamRepo.createTeam(
      param.name,
      param.teamManager,
      param.treamMember,
      param.token,
    );
  }
}

class CreateTeamParams {
  String name;
  String teamManager;
  List<int> treamMember;
  String token;
  CreateTeamParams(
      {required this.name,
      required this.teamManager,
      required this.treamMember,
      required this.token});
}
