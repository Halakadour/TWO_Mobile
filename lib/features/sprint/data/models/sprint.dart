import 'package:two_mobile/features/task/data/models/task_model.dart';

class Sprint {
  final int id;
  final String label;
  final String description;
  final String goal;
  final DateTime start;
  final DateTime end;
  final String status;
  final List<TaskModel> tasks;

  Sprint({
    required this.id,
    required this.label,
    required this.description,
    required this.goal,
    required this.start,
    required this.end,
    required this.status,
    required this.tasks,
  });

  factory Sprint.fromJson(Map<String, dynamic> json) => Sprint(
        id: json["id"],
        label: json["label"],
        description: json["description"],
        goal: json["goal"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        status: json["status"],
        tasks: List<TaskModel>.from(
          json["tasks"].map((x) => TaskModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "description": description,
        "goal": goal,
        "start": start.toIso8601String(),
        "end": end.toIso8601String(),
        "status": status,
        "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
      };
}
