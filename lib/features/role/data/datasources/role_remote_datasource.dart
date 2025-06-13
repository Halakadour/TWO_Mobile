import 'package:two_mobile/config/constants/baseuri.dart';
import 'package:two_mobile/core/api/get_api.dart';
import 'package:two_mobile/features/role/data/models/role_response_model.dart';

abstract class RoleRemoteDatasource {
  Future<RoleResponesModel> showProgrammerRole();
  Future<RoleResponesModel> showClientRole();
}

class RoleRemoteDatasourceImpl extends RoleRemoteDatasource {
  @override
  Future<RoleResponesModel> showClientRole() async {
    final result = GetApi(
      uri: Uri.parse("$baseUri/api/show/role/client"),
      fromJson: roleResponesModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<RoleResponesModel> showProgrammerRole() async {
    final result = GetApi(
      uri: Uri.parse("$baseUri/api/show/roles"),
      fromJson: roleResponesModelFromJson,
    );
    return await result.callRequest();
  }
}
