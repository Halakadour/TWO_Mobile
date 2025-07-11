class TaskEntity {
  final int id;
  final String title;
  final String description;
  final String status;
  final String assignedTo;
  final String priority;
  final double tCompletion;
  final DateTime startDate;
  final DateTime endDate;

  TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.assignedTo,
    required this.priority,
    required this.tCompletion,
    required this.startDate,
    required this.endDate,
  });
}
