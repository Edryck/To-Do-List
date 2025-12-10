import 'package:flutter/material.dart';
import 'package:flutter_aplication_todolist/data/task_repository.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/task_model.dart';

class TaskListItem extends StatelessWidget {
  final TaskModel task;
  final TaskRepository repository;
  final Function(bool?) onCheckChanged;
  final Function(BuildContext)? onEdit;
  final Function(BuildContext)? onDelete;

  const TaskListItem({
    super.key, 
    required this.task,
    required this.repository,
    required this.onCheckChanged,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Slidable(
        // Aparece no final do item ao segurar e arrastar para a esquerda
        endActionPane: ActionPane(
          motion: const DrawerMotion(), 
          children: [
            SlidableAction(
              onPressed: onDelete,
              icon: Icons.delete, 
              backgroundColor: Colors.red,
            ),
            SlidableAction(
              onPressed: onEdit,
              icon: Icons.edit,
              backgroundColor: Colors.blueGrey,
            )
          ]
        ),
        child: ListTile(
          // Checkbox
          leading: Checkbox(
            value: task.isCompleted, 
            onChanged: onCheckChanged
          ),

          // Título da tarefa
          title: Text(
            task.title,
            style: TextStyle(
              decoration: task.isCompleted
                ? TextDecoration.lineThrough // Caso seja marcado como concluído, risca o texto
                : TextDecoration.none,
              color: task.isCompleted ? Colors.grey : Colors.black,
              fontSize: 18,
            ),
          ),

          // O subtitulo é a descrição da tarefa e a data de criação dela
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.description,
                style: TextStyle(
                  decoration: task.isCompleted
                    ? TextDecoration.lineThrough // Caso seja marcado como concluído, risca o texto
                    : TextDecoration.none,
                  color: task.isCompleted ? Colors.grey : Colors.black,
                  fontSize: 14,
                ),
              ),
              Text(
                "${task.createdAt.day}/${task.createdAt.month}/${task.createdAt.year} - ${task.createdAt.hour}:${task.createdAt.minute}",
                style: const TextStyle(
                  fontSize: 12
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}