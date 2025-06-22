class EmployeeModel {
  final int id;
  final String name;
  final String email;
  final String image;
  final String role;
  final String cv;
  final int approved;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.role,
    required this.cv,
    required this.approved,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
        role: json["role"],
        cv: json["cv"],
        approved: json["approved"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
        "role": role,
        "cv": cv,
        "approved": approved,
      };
}
