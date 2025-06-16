import 'package:two_mobile/config/constants/baseuri.dart';

import 'package:two_mobile/core/api/post_api_with_token.dart';
import 'package:two_mobile/features/team/data/model/add_member_response_model.dart';

import 'package:two_mobile/features/team/data/model/create_team_response_model.dart';

abstract class TeamDatasource {
// create team
  Future<TeamResponseModel> createTeam(
    String token,
    String name,
    String teamManager,
    // Change from String to List<int>
    List<int> treamMember,
  );

// add members
  Future<AddMembersResponseModel> addMember(
    String token,
    String teamId,
    List<int> teamMembers,
  );
}

class TeamDatasourceImpl extends TeamDatasource {
  // create team
  @override
  Future<TeamResponseModel> createTeam(
    String token,
    String name,
    String teamManager,
    List<int> treamMember,
  ) async {
    final result = PostApiWithToken(
        token: token,
        uri: Uri.parse("{{$baseUri}}/api/create/team"),
        body: ({
          "name": name,
          "team_manager": teamManager,
          "team_member": treamMember
        }),
        fromJson: teamResponseModelFromJson);
    return await result.call();
  }

  // add members
  @override
  Future<AddMembersResponseModel> addMember(
    String token,
    String teamId,
    List<int> teamMembers,
  ) async {
    final result = PostApiWithToken(
        uri: Uri.parse("{{$baseUri}}/api/add/members"),
        token: token,
        body: ({
          "team_id": teamId,
          "team_members": teamMembers,
        }),
        fromJson: addMembersResponseModelFromJson);
    return await result.call();
  }
}
