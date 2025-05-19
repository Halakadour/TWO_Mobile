import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/api/failures.dart';
import 'package:two_mobile/core/usecase/usecase.dart';
import 'package:two_mobile/features/auth/data/models/update_client_prfile_response_model.dart';
import 'package:two_mobile/features/auth/domain/repo/auth_repo.dart';

class UpdateClientProfileUsecase extends Usecase<
    Future<Either<Failure, UpdateClientProfileResponseModel>>,
    UpdateClientProfileParams> {
  final AuthRepo authRepo;

  UpdateClientProfileUsecase({required this.authRepo});
  @override
  Future<Either<Failure, UpdateClientProfileResponseModel>> call(
      UpdateClientProfileParams param) {
    return authRepo.cleintupdateprofile(
        param.roleid, param.image, param.subject, param.phone, param.token);
  }
}

class UpdateClientProfileParams {
  String roleid;
  String image;
  String subject;
  String phone;
  String token;
  UpdateClientProfileParams(
      {required this.roleid,
      required this.image,
      required this.subject,
      required this.phone,
      required this.token});
}
