import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/team/domain/repo/team_repo.dart';

class AddMembersUsecase
    extends UseCase<Future<Either<Failure, Unit>>, AddMemberParams> {
  final TeamRepo teamRepo;

  AddMembersUsecase({required this.teamRepo});

  @override
  Future<Either<Failure, Unit>> call(AddMemberParams param) {
    return teamRepo.addMember(
      param.teamId,
      param.teamMembers,
      param.token,
    );
  }
}

class AddMemberParams {
  String teamId;
  List<int> teamMembers;

  String token;
  AddMemberParams({
    required this.teamId,
    required this.teamMembers,
    required this.token,
  });
}
