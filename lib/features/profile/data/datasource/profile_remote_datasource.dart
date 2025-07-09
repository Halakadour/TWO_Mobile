import 'package:two_mobile/config/constants/baseuri.dart';
import 'package:two_mobile/core/api/get_api.dart' show GetApi;
import 'package:two_mobile/core/api/post_api.dart' show PostApi;
import 'package:two_mobile/features/profile/data/models/profile_response_model.dart'
    show Profile, profileFromJson;

abstract class ProfileRemoteDataSource {
  Future<Profile> userProfile();
  Future<Profile> userUsingFilterBased();
  Future<Profile> updateProfile(String image, String cv, String roleId);
  Future<Profile> updateFreelancerProfile(String roleId, String image);

}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl();

  @override
  Future<Profile> userProfile() async {
    final result = GetApi(
      uri: Uri.parse("$baseUri/api/user/profile"),
      fromJson: profileFromJson,
    );
    print('======================================================');
    print('UserProfile ===========' +result.toString());
    return await result.callRequest();
  }

  @override
  Future<Profile> userUsingFilterBased() async {
    int? id;
    final result = GetApi(
      uri: Uri.parse("$baseUri/api/show/users?filter[role_id]=$id"),
      fromJson: profileFromJson,
    );
    print('======================================================');

    print('userUsingFilterBased ===========' +result.toString());
    return await result.callRequest();
  }
  @override
  Future<Profile> updateProfile(String image, String cv, String roleId) async {
    final result = PostApi(
      uri: Uri.parse("$baseUri/api/update/employee/profile"),
      body: {"image": image, "cv": cv, "role_id": roleId},
      fromJson: profileFromJson,
    );
    print('======================================================');

    print('updateProfile ===========' +result.toString());
    return await result.call();
  }
  @override
  Future<Profile> updateFreelancerProfile(String roleId, String image) async {
    final result = PostApi(
      uri: Uri.parse("$baseUri/api/update/freelancer/profile"),
      body: {"role_id": roleId, "image": image},
      fromJson: profileFromJson,
    );
    print('======================================================');

    print('updateFreelancerProfile ===========' +result.toString());

    return await result.call();
  }
}
