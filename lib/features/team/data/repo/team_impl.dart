import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/features/team/data/datasource/team_datasource.dart';
import 'package:two_mobile/features/team/data/model/team_model.dart';
import 'package:two_mobile/features/team/domain/repo/team_repo.dart';

class TeamRepoImpl extends TeamRepo {
  final TeamDatasource teamDatasource;

  TeamRepoImpl({required this.teamDatasource});
  // create team
  @override
  Future<Either<Failure, Unit>> createTeam(
      String name, String teamManager, List<int> treamMember, String token) {
    return wrapHandling(tryCall: () async {
      await teamDatasource.createTeam(
        token,
        name,
        teamManager,
        treamMember,
      );
      return const Right(unit);
    });
  }

// add members
  @override
  Future<Either<Failure, Unit>> addMember(
      String teamId, List<int> teamMembers, String token) {
    return wrapHandling(tryCall: () async {
      await teamDatasource.addMember(
        token,
        teamId,
        teamMembers,
      );
      return const Right(unit);
    });
  }

  // show team
  @override
  Future<Either<Failure, List<TeamModel>>> showTeam() {
    return wrapHandling(tryCall: () async {
      await teamDatasource.showTeam();
      final result = await teamDatasource.showTeam();
      return Right(result.data);
    });
  }
}
