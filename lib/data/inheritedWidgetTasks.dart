import 'package:flutter/material.dart';
import 'package:tasks/components/taskWidget.dart';

class InheritedWidgetTasks extends InheritedWidget {
  InheritedWidgetTasks({super.key, required super.child});

  double globalLevel = 0;
  String globalLevelString = '0,00';

  List<Task> tasks = [
    Task(
      nameTask: 'Aprender Flutter',
      urlImage: 'assets/images/dash.png',
      difficulty: 3,
    ),
    Task(
      nameTask: 'Andar de bike',
      urlImage: 'assets/images/bike.webp',
      difficulty: 2,
    ),
    Task(
      nameTask: 'Meditar',
      urlImage: 'assets/images/meditar.jpeg',
      difficulty: 5,
    ),
    Task(
      nameTask: 'Ler livro',
      urlImage: 'assets/images/livro.jpg',
      difficulty: 3,
    ),
    Task(
      nameTask: 'Jogar',
      urlImage: 'assets/images/jogar.jpg',
      difficulty: 1,
    ),
  ];

  void createTask(String nameTask, String urlImage, int difficulty) {
    tasks.add(
        Task(nameTask: nameTask, urlImage: urlImage, difficulty: difficulty));
  }

  void incrementTotalValue(int difficulty) {
    globalLevel += difficulty / 10;
    globalLevelString = globalLevel.toStringAsFixed(2);
    globalLevelString = globalLevelString.replaceAll('.', ',');
  }

  static InheritedWidgetTasks? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedWidgetTasks>();
  }

  static InheritedWidgetTasks of(BuildContext context) {
    final InheritedWidgetTasks? result = maybeOf(context);
    assert(result != null, 'No InheritedWidgetTasks found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedWidgetTasks oldWidget) {
    return tasks != oldWidget.tasks;
  }
}
