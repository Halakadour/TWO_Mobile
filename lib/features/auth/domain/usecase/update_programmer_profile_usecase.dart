import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/api/failures.dart';
import 'package:two_mobile/core/usecase/usecase.dart';
import 'package:two_mobile/features/auth/data/models/update_programmer_profile_response_model.dart';
import 'package:two_mobile/features/auth/domain/repo/auth_repo.dart';

class UpdateProgrammerProfileUsecase extends Usecase<
    Future<Either<Failure, UpdateEmployeeProfileResponseModel>>,
    UpdateProgrammerParams> {
  final AuthRepo authRepo;

  UpdateProgrammerProfileUsecase({required this.authRepo});
  @override
  Future<Either<Failure, UpdateEmployeeProfileResponseModel>> call(
      UpdateProgrammerParams param) {
    return authRepo.programmerUpdateProfile(
        param.token, param.image, param.cv, param.roleId);
  }
}

class UpdateProgrammerParams {
  String token;
  String image;
  String cv;
  String roleId;
  UpdateProgrammerParams({
    required this.token,
    required this.image,
    required this.cv,
    required this.roleId,
  });
}
