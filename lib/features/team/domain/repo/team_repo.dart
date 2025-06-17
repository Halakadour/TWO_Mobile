import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/error/handling_exception_manager.dart';
import 'package:two_mobile/features/team/data/model/show_team_response_model.dart';
import 'package:two_mobile/features/team/domain/entity/team_entity.dart';

abstract class TeamRepo with HandlingExceptionManager {
  // change the return type to Unit whiche mean void cause we need data 👀✨

  // create team
  Future<Either<Failure, Unit>> createTeam(
    String name,
    String teamManager,
    List<int> treamMember,
    String token,
  );

  // add members
  Future<Either<Failure, Unit>> addMember(
    String teamId,
    List<int> teamMembers,
    String token,
  );

  // show team
  Future<Either<Failure, List<TeamEntity>>> showTeam();
}
