import 'dart:convert';

SpecifyProjectTeamResponseModel specifyProjectTeamResponseModelFromJson(
        String str) =>
    SpecifyProjectTeamResponseModel.fromJson(json.decode(str));

String specifyProjectTeamResponseModelToJson(
        SpecifyProjectTeamResponseModel data) =>
    json.encode(data.toJson());

class SpecifyProjectTeamResponseModel {
  final String message;

  SpecifyProjectTeamResponseModel({
    required this.message,
  });

  factory SpecifyProjectTeamResponseModel.fromJson(Map<String, dynamic> json) =>
      SpecifyProjectTeamResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
