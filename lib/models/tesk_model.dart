class TaskModel {
  String title;
  bool isCompleted;
  DateTime createdAt;

  TaskModel({
    required this.title,
    this.isCompleted = false,
    required this.createdAt,
  });
}