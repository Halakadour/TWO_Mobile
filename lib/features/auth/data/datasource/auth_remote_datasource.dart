import 'package:two_mobile/config/constants/baseuri.dart';
import 'package:two_mobile/core/api/post_api.dart';
import 'package:two_mobile/core/api/post_api_with_token.dart';
import 'package:two_mobile/features/auth/data/models/login_response_model.dart';
import 'package:two_mobile/features/auth/data/models/sign_up_response_model.dart';
import 'package:two_mobile/features/auth/data/models/update_client_prfile_response_model.dart';
import 'package:two_mobile/features/auth/data/models/update_programmer_profile_response_model.dart';

abstract class AuthRemoteDatasource {
  // login
  Future<LoginResponseModel> login(
    String email,
    String password,
  );
  // sign up
  Future<SignupResponseModel> signup(
    String name,
    String email,
    String password,
    String passwordConfirmation,
  );
  // update client profile
  Future<UpdateClientProfileResponseModel> cleintUpdateProfile(
    String token,
    String roleId,
    String image,
  );
  Future<UpdateEmployeeProfileResponseModel> programmerUpdateProfile(
    String token,
    String image,
    String cv,
    String roleId,
  );
}

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  // login
  @override
  Future<LoginResponseModel> login(String email, String password) async {
    final result = PostApi(
        uri: Uri.parse("$baseUri/api/login"),
        body: ({"email": email, "password": password}),
        fromJson: loginResponseModelFromJson);
    return await result.call();
  }

// sign Up
  @override
  Future<SignupResponseModel> signup(String name, String email, String password,
      String passwordConfirmation) async {
    final result = PostApi(
        uri: Uri.parse("$baseUri/api/register"),
        body: ({
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": passwordConfirmation
        }),
        fromJson: signupResponseModelFromJson);
    return await result.call();
  }

// update  client profile
  @override
  Future<UpdateClientProfileResponseModel> cleintUpdateProfile(
      String token, String roleId, String image) async {
    final result = PostWithTokenApi(
        uri: Uri.parse("$baseUri/api/update/freelancer/profile"),
        body: ({
          "role_id": roleId,
          "image": image,
        }),
        fromJson: updateClientProfileResponseModelFromJson,
        token: token);
    return await result.call();
  }

  // update programmer profile
  @override
  Future<UpdateEmployeeProfileResponseModel> programmerUpdateProfile(
    String token,
    String image,
    String cv,
    String roleId,
  ) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/update/employee/profile"),
      token: token,
      body: ({
        "image": image,
        "cv": cv,
        "role_id": roleId,
      }),
      fromJson: updateEmployeeProfileResponseModelFromJson,
    );
    return await result.call();
  }
}
