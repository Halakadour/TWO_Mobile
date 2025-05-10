import 'dart:convert';

SignupResponseModel signupResponseModelFromJson(String str) =>
    SignupResponseModel.fromJson(json.decode(str));

String signupResponseModelToJson(SignupResponseModel data) =>
    json.encode(data.toJson());

class SignupResponseModel {
  final int status;
  final String msg;
  final SignUpModel data;

  SignupResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      SignupResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: SignUpModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class SignUpModel {
  final List<String> email;

  SignUpModel({
    required this.email,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        email: List<String>.from(json["email"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email": List<dynamic>.from(email.map((x) => x)),
      };
}
