import 'package:two_mobile/config/constants/baseuri.dart';
import 'package:two_mobile/core/api/post_api.dart';
import 'package:two_mobile/features/auth/data/models/login_response_model.dart';
import 'package:two_mobile/features/auth/data/models/sign_up_response_model.dart';

abstract class AuthRemoteDatasource {
  Future<LoginResponseModel> login(String email, String password);
  Future<SignupResponseModel> signup(
    String name,
    String email,
    String password,
    String passwordConfirmation,
  );
}

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  @override
  Future<LoginResponseModel> login(String email, String password) async {
    final result = PostApi(
        uri: Uri.parse("$baseuri/api/login"),
        body: ({"email": email, "password": password}),
        fromJson: loginResponseModelFromJson);
    return await result.call();
  }

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
}
