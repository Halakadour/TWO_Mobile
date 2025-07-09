import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/usecase/usecase.dart';
import 'package:two_mobile/features/profile/data/models/profile_response_model.dart' show Profile;
import 'package:two_mobile/features/profile/domain/repo/profile_repo.dart';

class UpdateProfileUsecase
    extends Usecase<Future<Either<Failure, Profile>>, UpdateProfileParams> {
  final ProfileRepo profileRepo;
  UpdateProfileUsecase({required this.profileRepo});

  @override
  Future<Either<Failure, Profile>> call(UpdateProfileParams param) {
    return profileRepo.updateProfile(param.image, param.cv, param.roleId);
  }
}

class UpdateProfileParams {
  final String image;
  final String cv;
  final String roleId;
  UpdateProfileParams({required this.image, required this.cv, required this.roleId});
}