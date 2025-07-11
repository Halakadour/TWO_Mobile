import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/profile/data/models/profile_response_model.dart'
    show Profile;
import 'package:two_mobile/features/profile/domain/repo/profile_repo.dart';

class UpdateFreelancerProfileUsecase extends UseCase<
    Future<Either<Failure, Profile>>, UpdateFreelancerProfileParams> {
  final ProfileRepo profileRepo;

  UpdateFreelancerProfileUsecase({required this.profileRepo});

  @override
  Future<Either<Failure, Profile>> call(UpdateFreelancerProfileParams param) {
    return profileRepo.updateFreelancerProfile(param.roleId, param.image);
  }
}

class UpdateFreelancerProfileParams {
  final String roleId;
  final String image;

  UpdateFreelancerProfileParams({required this.roleId, required this.image});
}
