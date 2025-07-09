import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/features/profile/data/datasource/profile_remote_datasource.dart';
import 'package:two_mobile/features/profile/data/models/profile_response_model.dart' show Profile;
import 'package:two_mobile/features/profile/domain/repo/profile_repo.dart' show ProfileRepo;

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDatasource;

  ProfileRepoImpl({required this.profileRemoteDatasource});

  @override
  Future<Either<Failure, Profile>> userProfile() {
    return wrapHandling(
      tryCall: () async {
        final result = await profileRemoteDatasource.userProfile();
        print('userProfile'+result.toString());

        return Right(result);
      },
    );
  }

  @override
  Future<Either<Failure, Profile>> userUsingFilterBased() {
    return wrapHandling(
      tryCall: () async {
        final result = await profileRemoteDatasource.userUsingFilterBased();
        print('userUsingFilterBased'+result.toString());
        return Right(result);
      },
    );
  }

  @override
  Future<Either<Failure, Profile>> updateProfile(String image, String cv, String roleId) {
    return wrapHandling(
      tryCall: () async {
        final result = await profileRemoteDatasource.updateProfile(image, cv, roleId);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<Failure, Profile>> updateFreelancerProfile(String roleId, String image) {
    return wrapHandling(
      tryCall: () async {
        final result = await profileRemoteDatasource.updateFreelancerProfile(roleId, image);
        return Right(result);
      },
    );
  }
}