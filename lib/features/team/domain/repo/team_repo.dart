import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/error/handling_exception_manager.dart';
import 'package:two_mobile/features/team/data/model/add_member_response_model.dart';
import 'package:two_mobile/features/team/data/model/create_team_response_model.dart';

abstract class TeamRepo with HandlingExceptionManager {
  // create team
  Future<Either<Failure, TeamResponseModel>> createTeam(
    String name,
    String teamManager,
    String treamMember,
    String token,
  );

  // add members
  Future<Either<Failure, AddMembersResponseModel>> addMember(
    String teamId,
    List<int> teamMembers,
    String token,
  );
}
