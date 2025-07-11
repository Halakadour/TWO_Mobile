import 'package:two_mobile/config/constants/baseuri.dart';
import 'package:two_mobile/core/api/post_api_with_token.dart';
import 'package:two_mobile/core/param/casule_param.dart';
import 'package:two_mobile/core/param/status_param.dart';
import 'package:two_mobile/features/projects/data/model/update_project_response_model.dart';
import 'package:two_mobile/features/status/data/models/create_project_status_response_model.dart';
import 'package:two_mobile/features/status/data/models/show_status_list_response_model.dart';

abstract class StatusRemoteDataSource {
  // craete status
  Future<CreateStatusResponseModel> createStatus(CreateStatusParam param);
  // delete status
  Future<EmptyResponseModel> deleteStatus(DeleteStatusParam param);
  // update order
  Future<EmptyResponseModel> updateStatusOrder(UpdateStatusOrderParam param);

  // get status
  Future<ShowStatusListResponseModel> showStatus(TokenWithIdParam project);
}

class StatusRemoteDataSourceImpl extends StatusRemoteDataSource {
  @override
  Future<CreateStatusResponseModel> createStatus(
    CreateStatusParam param,
  ) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/create/status"),
      token: param.token,
      body: ({'project_id': param.projectId, 'name': param.name}),
      fromJson: createStatusResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> deleteStatus(DeleteStatusParam param) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/delete/status"),
      token: param.token,
      body: ({'project_id': param.projectId, 'status_id': param.statusId}),
      fromJson: emptyResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<ShowStatusListResponseModel> showStatus(
    TokenWithIdParam project,
  ) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/show/project/status"),
      token: project.token,
      body: ({'project_id': project.id}),
      fromJson: showStatusListResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> updateStatusOrder(
    UpdateStatusOrderParam param,
  ) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/update/status"),
      token: param.token,
      body: ({
        'status_id': param.statusId,
        'new_order': param.newOrder,
        'project_id': param.projectId,
      }),
      fromJson: emptyResponseModelFromJson,
    );
    return await result.call();
  }
}
