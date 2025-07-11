import 'dart:convert';

import 'package:two_mobile/features/status/data/models/status_model.dart';

CreateStatusResponseModel createStatusResponseModelFromJson(String str) =>
    CreateStatusResponseModel.fromJson(json.decode(str));

String createStatusResponseModelToJson(CreateStatusResponseModel data) =>
    json.encode(data.toJson());

class CreateStatusResponseModel {
  final int status;
  final String msg;
  final StatusModel data;

  CreateStatusResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory CreateStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateStatusResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: StatusModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}
