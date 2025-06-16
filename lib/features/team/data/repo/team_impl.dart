import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';

import 'package:two_mobile/features/team/data/datasource/team_datasource.dart';
import 'package:two_mobile/features/team/data/model/team_response_model.dart';
import 'package:two_mobile/features/team/domain/repo/team_repo.dart';

class TeamRopoImpl extends TeamRepo {
  late final TeamDatasource teamDatasource;
  // create team
  @override
  Future<Either<Failure, TeamResponseModel>> createTeam(
      String name, String teamManager, String treamMember, String token) {
    return wrapHandling(tryCall: () async {
      final result = await teamDatasource.createTeam(
        name,
        teamManager,
        treamMember,
        token,
      );
      return Right(result);
    });
  }
}
// add member
