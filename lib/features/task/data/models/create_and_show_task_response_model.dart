import 'dart:convert';

import 'package:two_mobile/features/task/data/models/task_model.dart';

CreateAndShowTaskResponseModel createAndShowTaskResponseModelFromJson(
  String str,
) =>
    CreateAndShowTaskResponseModel.fromJson(json.decode(str));

String createAndShowTaskResponseModelToJson(
  CreateAndShowTaskResponseModel data,
) =>
    json.encode(data.toJson());

class CreateAndShowTaskResponseModel {
  final int status;
  final String msg;
  final TaskModel data;

  CreateAndShowTaskResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory CreateAndShowTaskResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateAndShowTaskResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: TaskModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}
