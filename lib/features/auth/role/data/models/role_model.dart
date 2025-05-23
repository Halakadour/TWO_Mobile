class RoleModel {
  final int id;
  final String role;

  RoleModel({
    required this.id,
    required this.role,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        id: json["id"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
      };
}
