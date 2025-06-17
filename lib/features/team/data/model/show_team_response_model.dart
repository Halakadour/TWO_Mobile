// To parse this JSON data, do
//
//     final showTeamResponseModel = showTeamResponseModelFromJson(jsonString);

import 'dart:convert';

ShowTeamResponseModel showTeamResponseModelFromJson(String str) =>
    ShowTeamResponseModel.fromJson(json.decode(str));

String showTeamResponseModelToJson(ShowTeamResponseModel data) =>
    json.encode(data.toJson());

class ShowTeamResponseModel {
  final int status;
  final String msg;
  final List<Datum> data;

  ShowTeamResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowTeamResponseModel.fromJson(Map<String, dynamic> json) =>
      ShowTeamResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final int id;
  final String name;
  final List<Member> members;

  Datum({
    required this.id,
    required this.name,
    required this.members,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        members:
            List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
      };
}

class Member {
  final int id;
  final String name;
  final String email;
  final String? image;
  final String role;
  final String? cv;

  Member({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.role,
    required this.cv,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
        role: json["role"],
        cv: json["cv"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
        "role": role,
        "cv": cv,
      };
}
