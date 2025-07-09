import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/usecase/usecase.dart';
import 'package:two_mobile/features/profile/data/models/profile_response_model.dart' show Profile;
import 'package:two_mobile/features/profile/domain/repo/profile_repo.dart';

class UserProfileUsecase
    extends Usecase<Future<Either<Failure, Profile>>, NoParams> {
  final ProfileRepo profileRepo;
  UserProfileUsecase({required this.profileRepo});

  @override
  Future<Either<Failure, Profile>> call(NoParams param) {
    return profileRepo.userProfile();
  }
}

class NoParams {}