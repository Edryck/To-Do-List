import '../models/task_model.dart';

class TaskRepository {
  // Lista que vai simular o "Banco de Dados", portanto ela vai ser privada
  final List<TaskModel> _tasks = [];

  // Getter para ler as tarefas, ele retorna a lista para que a UI possa exibir
  List<TaskModel> get tasks => _tasks;

  // Método para adicionar uma nova tarefa
  void addTask(String title) {
    final newTask = TaskModel(
      title: title, 
      createdAt: DateTime.now(),
    );
    _tasks.add(newTask);
  }

  void editTask(TaskModel task, String newTitle) {
    task.title = newTitle;
  }

  // Método para excluir uma tarefa
  void removeTask(TaskModel task) {
    _tasks.remove(task);
  }

  // Método que vai alterar o status da tarefa (Concluído/Pendente)
  void toggleTaskStatus(TaskModel task) {
    task.isCompleted = !task.isCompleted;
  }
}