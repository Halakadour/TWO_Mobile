import 'package:two_mobile/config/constants/baseuri.dart';

import 'package:two_mobile/core/api/post_api_with_token.dart';

import 'package:two_mobile/features/team/data/model/team_response_model.dart';

abstract class TeamDatasource {
// create team
  Future<TeamResponseModel> createTeam(
    String name,
    String teamManager,
    String treamMember,
    String token,
  );
}

class TeamDatasourceImpl extends TeamDatasource {
  // create team
  @override
  Future<TeamResponseModel> createTeam(
      String name, String teamManager, String treamMember, String token) async {
    final result = PostApiWithToken(
        token: token,
        uri: Uri.parse("{{$baseUri}}/api/create/team"),
        body: ({
          "name": name,
          "team_manager": teamManager,
          "team_member": treamMember
        }),
        fromJson: TeamResponseModelFromJson);
    return await result.call();
  }
}
