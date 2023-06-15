import 'package:flutter/material.dart';
import 'package:tasks/components/task.dart';

class TaskInherited extends InheritedWidget {

  TaskInherited({
    Key? key,
    required Widget child,
  }) : super (key: key, child: child);

  final List<Task> taskList = [
    Task(
      nome: 'Aprender Flutter',
      imagem: 'assets/images/dash.png',
      dificuldade: 3,
    ),
    Task(
      nome: 'Andar de bike',
      imagem: 'assets/images/bike.webp',
      dificuldade: 2,
    ),
    Task(
      nome: 'Ler',
      imagem: 'assets/images/livro.jpg',
      dificuldade: 5,
    ),
    Task(
      nome: 'Meditar',
      imagem: 'assets/images/meditar.jpeg',
      dificuldade: 4,
    ),
    Task(
      nome: "Jogar",
      imagem: 'assets/images/jogar.jpg',
      dificuldade: 1,
    ),
  ];


  void newTask (String name, String photo, int difficulty){
    taskList.add(Task(nome: name, imagem: photo, dificuldade: difficulty));
  }


  //é um método estático, ou seja não precisa de instância para ser executado.
  // ele recebe como algumento o contexto atual em que a função é chamada
  static TaskInherited of(BuildContext context){
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}