import '../models/task_model.dart';

class TaskRepository {
  // Lista que vai simular o "Banco de Dados", portanto ela vai ser privada
  final List<TaskModel> _tasks = [];

  // Getter para ler as tarefas, ele retorna a lista para que a UI possa exibir
  List<TaskModel> get tasks => _tasks;

  // Método para adicionar uma nova tarefa
  void addTask(String title, String description) {
    final newTask = TaskModel(
      title: title, 
      description: description,
      createdAt: DateTime.now(),
    );
    _tasks.add(newTask);
  }

  // Método para editar uma tarefa
  void editTask(TaskModel task, String newTitle, String newDescription) {
    task.title = newTitle;
    task.description = newDescription;
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