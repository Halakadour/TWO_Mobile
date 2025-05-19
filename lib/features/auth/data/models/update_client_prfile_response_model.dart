// To parse this JSON data, do
//
//     final updateClientProfileResponseModel = updateClientProfileResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateClientProfileResponseModel updateClientProfileResponseModelFromJson(
        String str) =>
    UpdateClientProfileResponseModel.fromJson(json.decode(str));

String updateClientProfileResponseModelToJson(
        UpdateClientProfileResponseModel data) =>
    json.encode(data.toJson());

class UpdateClientProfileResponseModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  UpdateClientProfileResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory UpdateClientProfileResponseModel.fromJson(
          Map<String, dynamic> json) =>
      UpdateClientProfileResponseModel(
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
