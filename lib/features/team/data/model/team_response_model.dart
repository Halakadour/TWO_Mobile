import 'dart:convert';

TeamResponseModel TeamResponseModelFromJson(String str) => TeamResponseModel.fromJson(json.decode(str));

String TeamResponseModelToJson(TeamResponseModel data) => json.encode(data.toJson());

class TeamResponseModel {
    final int status;
    final String msg;
    final Data data;

    TeamResponseModel({
        required this.status,
        required this.msg,
        required this.data,
    });

    TeamResponseModel copyWith({
        int? status,
        String? msg,
        Data? data,
    }) => 
        TeamResponseModel(
            status: status ?? this.status,
            msg: msg ?? this.msg,
            data: data ?? this.data,
        );

    factory TeamResponseModel.fromJson(Map<String, dynamic> json) => TeamResponseModel(
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

    Data copyWith({
        int? id,
        String? name,
        List<Member>? members,
    }) => 
        Data(
            id: id ?? this.id,
            name: name ?? this.name,
            members: members ?? this.members,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        members: List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
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

    Member copyWith({
        int? id,
        String? name,
        String? email,
        String? image,
        String? role,
        String? cv,
    }) => 
        Member(
            id: id ?? this.id,
            name: name ?? this.name,
            email: email ?? this.email,
            image: image ?? this.image,
            role: role ?? this.role,
            cv: cv ?? this.cv,
        );

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
