import 'package:two_mobile/config/constants/baseuri.dart';
import 'package:two_mobile/core/api/post_api.dart';
import 'package:two_mobile/core/api/post_api_with_token.dart';
import 'package:two_mobile/features/auth/data/models/login_response_model.dart';
import 'package:two_mobile/features/auth/data/models/sign_up_response_model.dart';
import 'package:two_mobile/features/auth/data/models/update_client_prfile_response_model.dart';

abstract class AuthRemoteDatasource {
  Future<LoginResponseModel> login(String email, String password);
  Future<SignupResponseModel> signup(
    String name,
    String email,
    String password,
    String passwordConfirmation,
  );
  Future<UpdateClientProfileResponseModel> cleintupdateprofile(
      String token, String roleid, String image, String subject, String phone);
}

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  // login
  @override
  Future<LoginResponseModel> login(String email, String password) async {
    final result = PostApi(
        uri: Uri.parse("$baseuri/api/login"),
        body: ({"email": email, "password": password}),
        fromJson: loginResponseModelFromJson);
    return await result.call();
  }

// sign Up
  @override
  Future<SignupResponseModel> signup(String name, String email, String password,
      String passwordConfirmation) async {
    final result = PostApi(
        uri: Uri.parse("$baseuri/api/register"),
        body: ({
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": passwordConfirmation
        }),
        fromJson: signupResponseModelFromJson);
    return await result.call();
  }

// update profile client
  @override
  Future<UpdateClientProfileResponseModel> cleintupdateprofile(String token,
      String roleid, String image, String subject, String phone) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseuri/api/update/client/profile"),
        body: ({
          "role_id": roleid,
          "image": image,
          "subject": subject,
          "phone": phone
        }),
        fromJson: updateClientProfileResponseModelFromJson,
        token: token);
    return await result.call();
  }
}
