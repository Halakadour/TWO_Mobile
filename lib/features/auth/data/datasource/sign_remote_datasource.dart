import 'package:two_mobile/core/api/post_api.dart';
import 'package:two_mobile/features/auth/data/models/sign_up_response_model.dart';
import 'package:two_mobile/config/constants/baseuri.dart';

abstract class SignupremoteDatasource {
  Future<SignupResponseModel> signup(
    String name,
    String email,
    String password,
    String passwordConfirmation,
  );
}

class SignupremoteDatasourceImpl extends SignupremoteDatasource {
  @override
  Future<SignupResponseModel> signup(String name, String email, String password,
      String passwordConfirmation) async {
    final result = PostApi(
        uri: Uri.parse("$baseuri/api/login"),
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
