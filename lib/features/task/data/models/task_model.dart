import 'package:two_mobile/features/task/domain/entity/task_entity.dart';

class TaskModel extends TaskEntity {
  final String completion;
  final DateTime start;
  final DateTime end;
  final dynamic sprint;

  TaskModel({
    required super.id,
    required super.title,
    required super.description,
    required super.assignedTo,
    required super.priority,
    required super.status,
    required this.completion,
    required this.start,
    required this.end,
    required this.sprint,
  }) : super(
          tCompletion: double.parse(completion),
          startDate: start,
          endDate: end,
        );

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        sprint: json["sprint"],
        status: json["status"],
        assignedTo: json["assigned_to"],
        priority: json["priority"],
        completion: json["completion"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "sprint": sprint,
        "status": status,
        "assigned_to": assignedTo,
        "priority": priority,
        "completion": completion,
        "start": start.toIso8601String(),
        "end": end.toIso8601String(),
      };
}
