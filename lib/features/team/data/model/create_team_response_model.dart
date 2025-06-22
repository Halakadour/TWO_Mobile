import 'dart:convert';

import 'package:two_mobile/features/team/data/model/team_model.dart';

TeamResponseModel teamResponseModelFromJson(String str) =>
    TeamResponseModel.fromJson(json.decode(str));

String teamResponseModelToJson(TeamResponseModel data) =>
    json.encode(data.toJson());

class TeamResponseModel {
  final int status;
  final String msg;
  final TeamModel data;

  TeamResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory TeamResponseModel.fromJson(Map<String, dynamic> json) =>
      TeamResponseModel(
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
