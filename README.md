# To-Do List - Flutter Application

Um aplicativo simples de Lista de Tarefas (To-Do List) desenvolvido em **Flutter**. O projeto permite ao usuário gerenciar suas atividades diárias com funcionalidades de criação, edição, exclusão e controle de status.
Este projeto serve como um exemplo prático de manipulação de estado local e estruturação de dados em Dart.

### Funcionalidades

O aplicativo oferece as seguintes funcionalidades principais:
**Adicionar tarefas:** Criação de novas tarefas com `Título` e `Descrição` através de uma caixa de dialogo personalizada.
**Listagem de Tarefas:** Visualização de todas as tarefas cadastradas, incluindo a data e hora de criação.
**Controle de Status:** Marcar tarefas como "Concluídas" ou "Pendentes" utilizando checkboxes. Tarefas concluídas recebem um estilo visual diferente (tachado).
**Edição:** Possibilidade de alterar o título e a descrição de uma tarefa existente.
**Exclusão com Gesto:** Utilize o gesto de deslizar para a esquerda (swipe) para revelar as opções de `Editar` ou `Excluir` a tarefa.
**Feedback Visual:** Interface limpa com feedback imediato ao usuário (atualização de lista via `setState`).

### Tecnologias Utilizadas

**Linguagem:** Dart
**Framework:** Flutter
**Gerenciamento de Estado:** `setState` (Nativo) 
**Pacotes Externos:**
+ **flutter_slidable:** Utilizado para criar as ações de deslizar nos itens da lista.

### Estrutura do Projeto

````
lib/
├── data/
│   └── task_repository.dart    # Simula um banco de dados local (CRUD) e gerencia a lista de tarefas.
├── models/
│   └── task_model.dart         # Modelo de dados que representa a entidade Tarefa.
├── widgets/
│   └── task_list_item.dart     # Componente visual que representa cada item da lista (Card).
└── screens/ (ou raiz)
    └── home_screen.dart        # Tela principal que gerencia o estado da UI e exibe a lista.
````

### Como executar

**Pré-requisitos:** Certifique-se de ter o Flutter SDK instalado.
**Clonar o Repositório:**
````
git clone git@github.com:Edryck/To-Do-List.git
````
**Instalar dependências:** Como o projeto utiliza o `flutter_slidable`, é necessário baixar os pacotes:
````
flutter pub get
````
**Executar o App:** 
````
flutter run
````

### Observações
**Persistência de Dados:** Atualmente, o aplicativo utiliza uma lista em memória (`List<TaskModel> _tasks`) dentro do `TaskRepository`. Isso significa que os dados serão perdidos ao fechar o aplicativo. Para versões futuras, irei implementar a  persistência local (como SQLite, Hive ou SharedPreferences).