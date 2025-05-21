// To parse this JSON data, do
//
//     final updateEmployeeProfileResponseModel = updateEmployeeProfileResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateEmployeeProfileResponseModel updateEmployeeProfileResponseModelFromJson(
        String str) =>
    UpdateEmployeeProfileResponseModel.fromJson(json.decode(str));

String updateEmployeeProfileResponseModelToJson(
        UpdateEmployeeProfileResponseModel data) =>
    json.encode(data.toJson());

class UpdateEmployeeProfileResponseModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  UpdateEmployeeProfileResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory UpdateEmployeeProfileResponseModel.fromJson(
          Map<String, dynamic> json) =>
      UpdateEmployeeProfileResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
