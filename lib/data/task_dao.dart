
import 'package:tasks/components/taskWidget.dart';

class TaskDao {
  static String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT,'
      '$_difficulty INTEGER,'
      '$_image TEXT'
      ')';

  static const String _tableName = 'TaskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';
  
  save(Task tarefa) async{}

  //TODO:: método que recupera todos as tarefas
  // Future<List<Task>> findAll() async{}

  //TODO:: método que encontra uma tarefa única com base no seu nome
  // Future<List<Task>> find(String nameOfTask) async{}

   delete(String nameOfTask) async{}



}
