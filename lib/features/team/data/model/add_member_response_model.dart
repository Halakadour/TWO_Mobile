import 'dart:convert';

import 'package:two_mobile/features/team/data/model/team_model.dart';

AddMembersResponseModel addMembersResponseModelFromJson(String str) =>
    AddMembersResponseModel.fromJson(json.decode(str));

String addMembersResponseModelToJson(AddMembersResponseModel data) =>
    json.encode(data.toJson());

class AddMembersResponseModel {
  final int status;
  final String msg;
  final TeamModel data;

  AddMembersResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory AddMembersResponseModel.fromJson(Map<String, dynamic> json) =>
      AddMembersResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: TeamModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}
