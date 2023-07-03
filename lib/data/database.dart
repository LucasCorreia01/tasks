import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tasks/data/task_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'task.db');  
  return openDatabase(path, onCreate: (db, version) 
  {
    db.execute(TaskDao.tableSql);
  }, version: 1);
}



