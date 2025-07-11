import 'dart:convert';

import 'package:two_mobile/features/sprint/data/models/sprint_model.dart';

ShowSprintsListResponseModel showSprintsListResponseModelFromJson(String str) =>
    ShowSprintsListResponseModel.fromJson(json.decode(str));

String showSprintsListResponseModelToJson(ShowSprintsListResponseModel data) =>
    json.encode(data.toJson());

class ShowSprintsListResponseModel {
  final int status;
  final String msg;
  final List<SprintModel> data;

  ShowSprintsListResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowSprintsListResponseModel.fromJson(Map<String, dynamic> json) =>
      ShowSprintsListResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: List<SprintModel>.from(
          json["data"].map((x) => SprintModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
