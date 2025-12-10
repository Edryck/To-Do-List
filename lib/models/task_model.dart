class TaskModel {
  String title;
  String description;
  bool isCompleted;
  DateTime createdAt;

  TaskModel({
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.createdAt,
  });
}