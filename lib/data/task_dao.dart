import 'package:sqflite/sqflite.dart';
import 'package:tasks/components/taskWidget.dart';
import 'package:tasks/data/database.dart';

class TaskDao {
  static String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT,'
      '$_difficulty INTEGER,'
      '$_image TEXT,'
      '$_level INTEGER'
      ')';

  static const String _tableName = 'TaskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';
  static const String _level = 'level';

  //Salva uma nova tarefa em nosso banco de dados;
  save(Task tarefa) async {
    // print('Estamos acessando o método save: ');
    final Database database = await getDatabase();
    var itemExists = await find(tarefa.nameTask);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      // print('A tarefa não existia');
      return await database.insert(_tableName, taskMap);
    } else {
      // print('A tarefa já exisite');
      return await database.update(_tableName, taskMap,
          where: '$_name = ?', whereArgs: [tarefa.nameTask]);
    }
  }

  //método que recupera todos as tarefas
  Future<List<Task>> findAll() async {
    // print('Estamos acessando o findAll: ');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tableName);
    // print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  //método que encontra uma tarefa única com base no seu nome
  Future<List<Task>> find(String nameOfTask) async {
    // print('Estamos acessando o find: ');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database
        .query(_tableName, where: '$_name LIKE ?', whereArgs: [nameOfTask]);
    // print(result);
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String nameOfTask) async {
    // print('Estamos acessando o método delete');
    final Database database = await getDatabase();
    return await database
        .delete(_tableName, where: '$_name = ?', whereArgs: [nameOfTask]);
  }

  //Transforma nosso mapa vindo do banco em um lista de tarefas para a nossa aplicação.
  List<Task> toList(List<Map<String, dynamic>> mapOfTasks) {
    // print('Convertendo to List:');
    // print(mapOfTasks);
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapOfTasks) {
      final Task tarefa = Task(
        nameTask: linha[_name],
        urlImage: linha[_image],
        difficulty: linha[_difficulty],
        level: linha[_level],
      );
      tarefas.add(tarefa);
    }
    // print(' Lista de tarefas: $tarefas');
    return tarefas;
  }

  //Transforma nossa tarefa em um mapa para savarmos
  Map<String, dynamic> toMap(Task tarefa) {
    // print('Convertendo tarefa em Map: ');
    final Map<String, dynamic> mapOfTasks = {};
    mapOfTasks[_name] = tarefa.nameTask;
    mapOfTasks[_difficulty] = tarefa.difficulty;
    mapOfTasks[_image] = tarefa.urlImage;
    mapOfTasks[_level] = tarefa.level;
    // print('Mapa de tarefas: $mapOfTasks');

    return mapOfTasks;
  }

  getLevel(String nameOfTask) async {
    List<Task> level = await find(nameOfTask);
    return level.first.level;
  }
}
