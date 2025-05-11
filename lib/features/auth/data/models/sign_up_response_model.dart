import 'dart:convert';

import 'login_response_model.dart';

SignupResponseModel signupResponseModelFromJson(String str) =>
    SignupResponseModel.fromJson(json.decode(str));

String signupResponseModelToJson(SignupResponseModel data) =>
    json.encode(data.toJson());

class SignupResponseModel {
  final int status;
  final String msg;
  final UserModel data;

  SignupResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      SignupResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: UserModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}
