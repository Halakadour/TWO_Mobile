import 'package:two_mobile/config/constants/baseuri.dart';
import 'package:two_mobile/core/api/get_with_token_api.dart';
import 'package:two_mobile/core/api/post_api_with_token.dart';

import 'package:two_mobile/features/projects/data/model/show_all_project-response_model.dart';
import 'package:two_mobile/features/projects/data/model/specify_project_team_response_model.dart';
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

  // Specify Project Team
  Future<SpecifyProjectTeamResponseModel> specifyProjectTeam(
    String projectId,
    String teamId,
    String token,
  );

  // show all porject
  Future<ShowProjectsResponseModel> showAllProject(String token);
}

class ProjectDatasourceImpl extends ProjectDatasource {
  // update project
  @override
  Future<EmptyResponseModel> updateProject(
    String fullName,
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
        body: ({
          "full_name": fullName,
          "company_name": companyName,
          "email": email,
          "phone": phone,
          "projectType": projectType,
          "project_descraption": projectDescraption,
          "cost": cost,
          "duration": duration,
          "requirements": requirements,
          "document": document,
          "cooperation_type": cooperationType,
          "contact_time": contactTime,
          "private": private,
          "project_id": projectId,
          "token": token,
        }),
        fromJson: emptyResponseModelFromJson);
    return await result.call();
  }

  // Specify Project Team
  @override
  Future<SpecifyProjectTeamResponseModel> specifyProjectTeam(
      String projectId, String teamId, String token) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/specify/project/team"),
        token: token,
        body: ({
          "project_id": projectId,
          "team_id": teamId,
          "token": token,
        }),
        fromJson: specifyProjectTeamResponseModelFromJson);
    return await result.call();
  }

  // show all project
  @override
  Future<ShowProjectsResponseModel> showAllProject(String token) async {
    final result = GetWithTokenApi(
        uri: Uri.parse("$baseUri/api/show/all/projects"),
        token: token,
        fromJson: showProjectsResponseModelFromJson);
    return await result.callRequest();
  }
}
