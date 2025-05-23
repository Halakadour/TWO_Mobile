import 'package:two_mobile/config/constants/baseuri.dart';
import 'package:two_mobile/core/api/get_api.dart';
import 'package:two_mobile/features/auth/role/data/models/show_client_role_role_response_model.dart';

abstract class RoleRemoteDatasource {
  Future<ShowClientRoleResponseModel> showClientRole();
  Future<ShowClientRoleResponseModel> showProgrammerRole();
}

class RoleRemoteDatasourceImpl extends RoleRemoteDatasource {
  @override
  Future<ShowClientRoleResponseModel> showClientRole() async {
    final result = GetApi(
        uri: Uri.parse("$baseuri/api/show/role/client"),
        fromJson: showClientRoleResponseModelFromJson);
    return await result.callRequest();
  }

  @override
  Future<ShowClientRoleResponseModel> showProgrammerRole() {
    // TODO: implement showProgrammerRole
    throw UnimplementedError();
  }
}
