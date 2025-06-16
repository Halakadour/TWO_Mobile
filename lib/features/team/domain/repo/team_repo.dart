import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/error/handling_exception_manager.dart';

abstract class TeamRepo with HandlingExceptionManager {
  // change the return type to Unit whiche mean void cause we need data
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
}
