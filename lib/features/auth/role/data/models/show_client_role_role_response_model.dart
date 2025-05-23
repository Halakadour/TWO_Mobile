import 'dart:convert';

import 'package:two_mobile/features/auth/role/data/models/role_model.dart';

ShowClientRoleResponseModel showClientRoleResponseModelFromJson(String str) =>
    ShowClientRoleResponseModel.fromJson(json.decode(str));

String showClientRoleResponseModelToJson(ShowClientRoleResponseModel data) =>
    json.encode(data.toJson());

class ShowClientRoleResponseModel {
  final int status;
  final String msg;
  final List<RoleModel> data;

  ShowClientRoleResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowClientRoleResponseModel.fromJson(Map<String, dynamic> json) =>
      ShowClientRoleResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: List<RoleModel>.from(
            json["data"].map((x) => RoleModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
