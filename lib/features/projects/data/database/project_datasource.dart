import 'package:two_mobile/config/constants/baseuri.dart';
import 'package:two_mobile/core/api/post_api_with_token.dart';
import 'package:two_mobile/features/projects/data/model/update_project_response_model.dart';

abstract class ProjectDatasource {
// update project
  Future<EmptyResponseModel> updateProject(
    String flullName,
    String companyName,
    String email,
    String phone,
    String projectType,
    String projectDescraption,
    String cost,
    String duration,
    String requirements,
    String document,
    String cooperationType,
    String contactTime,
    String private,
    String projectId,
    String token,
  );
}

class ProjectDatasourceImpl extends ProjectDatasource {
  // update project
  @override
  Future<EmptyResponseModel> updateProject(
    String flullName,
    String companyName,
    String email,
    String phone,
    String projectType,
    String projectDescraption,
    String cost,
    String duration,
    String requirements,
    String document,
    String cooperationType,
    String contactTime,
    String private,
    String projectId,
    String token,
  ) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/update/project"),
        token: token,
        body: ({}),
        fromJson: emptyResponseModelFromJson);
    return await result.call();
  }
}
