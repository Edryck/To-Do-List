import 'package:flutter/material.dart';
import 'package:flutter_aplication_todolist/models/task_model.dart';
import '../data/task_repository.dart';
import '../widgets/task_list_item.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// Aplicar o estilo dos botões da caixa de dialogo 
final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
);

class _HomeScreenState extends State<HomeScreen> {
  final TaskRepository repository = TaskRepository();

  // Função para atualizar a lista da interface
  void _refreshList() {
    setState(() {
    });
  }

  // Mostra a tela de dialogo onde será criado/editado a tarefa
  void _showTaskDialog({TaskModel? taskToEdit}) {
    // Vai definir o texto atual, caso seja edição, pega o título atual, Se não, vazio
    String initialText = taskToEdit != null ? taskToEdit.title : "";
    final TextEditingController textController = TextEditingController(text: initialText);

    // Define o título e o botão baseados no modo
    String dialogTitle = taskToEdit == null ? "Nova Tarefa" : "Editar Tarefa";
    String buttonText = taskToEdit == null ? "Adicionar" : "Salvar";

    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.all(
              Radius.circular(8)
            ),
          ),
          title: Text(dialogTitle),
          content: Padding(
            padding: const EdgeInsets.all(1),
            child: TextField(
              controller: textController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: "O que você precisa fazer?"
              ),
            ),
          ),
          actions: [
            TextButton(
              style: flatButtonStyle,
              onPressed: () => Navigator.pop(context), 
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              style: flatButtonStyle,
              onPressed: () {
                final String newTitle = textController.text;
                // Não pode ser vazio
                if (newTitle.isNotEmpty) {
                  if (taskToEdit == null) {
                    repository.addTask(newTitle);
                  } else {
                    if (newTitle != taskToEdit.title) {
                      repository.editTask(taskToEdit, newTitle);
                    }
                  }
                }
                _refreshList();
                Navigator.pop(context);
              }, 
              child: Text(buttonText),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Lista atualizada
    final tasks = repository.tasks;

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: const Text('To-Do List'),
        titleTextStyle: TextStyle(
          fontSize: 26,
        ),
        centerTitle: true,
      ),
      body: tasks.isEmpty
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.list_alt, 
                size: 80, 
                color: Colors.grey,
                ),
              Text("Nenhuma tarefa ainda!", style: TextStyle(color: Colors.grey)),
            ],
          ),
        )
        : ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            // Lista de tarefas
            return TaskListItem(
              task: task, 
              repository: repository,
              onCheckChanged: (bool? value) {
                repository.toggleTaskStatus(task);
                _refreshList();
              }, 
              // Quando seleciona editar
              onEdit: (context) => _showTaskDialog(taskToEdit: task),
              // Quando seleciona deletar
              onDelete: (context) {
                repository.removeTask(task);
                _refreshList();
              },
            );
          },
        ), 
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
        ),
        onPressed: () => _showTaskDialog(taskToEdit: null),
        tooltip: 'Criar tarefa',
        child: const Icon(Icons.add),
      ), 
    );
  }
}