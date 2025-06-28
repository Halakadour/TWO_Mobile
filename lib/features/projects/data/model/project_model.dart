class ProjectModel {
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
  final String? contract;
  final String status;
  final Team? team;

  ProjectModel({
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

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
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
        team: json["team"] == null ? null : Team.fromJson(json["team"]),
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
        "team": team?.toJson(),
      };
}

class Team {
  final int id;
  final String name;
  final List<Member> members;

  Team({required this.id, required this.name, required this.members});

  factory Team.fromJson(Map<String, dynamic> json) => Team(
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
  final bool isManager;

  Member({
    required this.id,
    required this.name,
    required this.email,
    required this.isManager,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        isManager: json["is_manager"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "is_manager": isManager,
      };
}
