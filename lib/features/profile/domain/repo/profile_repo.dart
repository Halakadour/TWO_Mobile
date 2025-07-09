import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/error/handling_exception_manager.dart';
import 'package:two_mobile/features/profile/data/models/profile_response_model.dart' show Profile;

abstract class ProfileRepo with HandlingExceptionManager {
  // Get user profile
  Future<Either<Failure, Profile>> userProfile();

  // Get user profile using filter based
  Future<Either<Failure, Profile>> userUsingFilterBased();

  // Update profile
  Future<Either<Failure, Profile>> updateProfile(String image, String cv, String roleId);

  // Update freelancer profile
  Future<Either<Failure, Profile>> updateFreelancerProfile(String roleId, String image);
}