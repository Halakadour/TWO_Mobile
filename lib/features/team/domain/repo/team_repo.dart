import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/error/handling_exception_manager.dart';
import 'package:two_mobile/features/team/data/model/team_response_model.dart';

abstract class TeamRepo with HandlingExceptionManager {
  // create team
  Future<Either<Failure, TeamResponseModel>> createTeam(
    String name,
    String teamManager,
    String treamMember,
    String token,
  );
}
