import 'package:two_mobile/config/constants/baseuri.dart';
import 'package:two_mobile/core/api/post_api.dart';
import 'package:two_mobile/features/auth/data/models/login_response_model.dart';

abstract class AuthRemoteDatasource {
  Future<LoginResponseModel> login(String email, String password);
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
}
