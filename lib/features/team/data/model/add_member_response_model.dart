import 'dart:convert';

AddMembersResponseModel addMembersResponseModelFromJson(String str) =>
    AddMembersResponseModel.fromJson(json.decode(str));

String addMembersResponseModelToJson(AddMembersResponseModel data) =>
    json.encode(data.toJson());

class AddMembersResponseModel {
  final int status;
  final String msg;
  final Data data;

  AddMembersResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory AddMembersResponseModel.fromJson(Map<String, dynamic> json) =>
      AddMembersResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  final int id;
  final String name;
  final List<Member> members;

  Data({
    required this.id,
    required this.name,
    required this.members,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
