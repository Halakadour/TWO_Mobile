// To parse this JSON data, do
//
//     final showMyProjectsResponseModel = showMyProjectsResponseModelFromJson(jsonString);

import 'dart:convert';

ShowMyProjectsResponseModel showMyProjectsResponseModelFromJson(String str) =>
    ShowMyProjectsResponseModel.fromJson(json.decode(str));

String showMyProjectsResponseModelToJson(ShowMyProjectsResponseModel data) =>
    json.encode(data.toJson());

class ShowMyProjectsResponseModel {
  final int status;
  final String msg;
  final List<MyProjectModel> data;

  ShowMyProjectsResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowMyProjectsResponseModel.fromJson(Map<String, dynamic> json) =>
      ShowMyProjectsResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: List<MyProjectModel>.from(
            json["data"].map((x) => MyProjectModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MyProjectModel {
  final int id;
  final String fullName;
  final String companyName;
  final String email;
  final String phone;
  final String projectType;
  final String projectDescription;
  final String cost;
  final String duration;
  final String requirements;
  final String document;
  final String cooperationType;
  final String contactTime;
  final int private;
  final dynamic contract;
  final String status;
  final dynamic team;

  MyProjectModel({
    required this.id,
    required this.fullName,
    required this.companyName,
    required this.email,
    required this.phone,
    required this.projectType,
    required this.projectDescription,
    required this.cost,
    required this.duration,
    required this.requirements,
    required this.document,
    required this.cooperationType,
    required this.contactTime,
    required this.private,
    required this.contract,
    required this.status,
    required this.team,
  });

  factory MyProjectModel.fromJson(Map<String, dynamic> json) => MyProjectModel(
        id: json["id"],
        fullName: json["full_name"],
        companyName: json["company_name"],
        email: json["email"],
        phone: json["phone"],
        projectType: json["project_type"],
        projectDescription: json["project_description"],
        cost: json["cost"],
        duration: json["duration"],
        requirements: json["requirements"],
        document: json["document"],
        cooperationType: json["cooperation_type"],
        contactTime: json["contact_time"],
        private: json["private"],
        contract: json["contract"],
        status: json["status"],
        team: json["team"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "company_name": companyName,
        "email": email,
        "phone": phone,
        "project_type": projectType,
        "project_description": projectDescription,
        "cost": cost,
        "duration": duration,
        "requirements": requirements,
        "document": document,
        "cooperation_type": cooperationType,
        "contact_time": contactTime,
        "private": private,
        "contract": contract,
        "status": status,
        "team": team,
      };
}
