import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/auth/data/models/update_client_prfile_response_model.dart';
import 'package:two_mobile/features/auth/domain/repo/auth_repo.dart';

class UpdateClientProfileUsecase extends UseCase<
    Future<Either<Failure, UpdateClientProfileResponseModel>>,
    UpdateClientProfileParams> {
  final AuthRepo authRepo;

  UpdateClientProfileUsecase({required this.authRepo});
  @override
  Future<Either<Failure, UpdateClientProfileResponseModel>> call(
      UpdateClientProfileParams param) {
    return authRepo.cleintUpdateProfile(param.roleid, param.image, param.token);
  }
}

class UpdateClientProfileParams {
  String roleid;
  String image;
  String token;
  UpdateClientProfileParams(
      {required this.roleid, required this.image, required this.token});
}
