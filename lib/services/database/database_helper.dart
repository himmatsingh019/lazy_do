import 'package:get/get.dart';
import 'package:lazy_do/model/task_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper extends GetxController {
  List<TaskModel> tasks = [];
  late Database database;

  DatabaseHelper() {
    getDatabase();
  }

  void getDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'lazydo.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE lazydo(id INTEGER PRIMARY KEY, title TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertTask(TaskModel task) async {
    await database.insert(
      'lazydo',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeTask(int? id) async {
    print(id);
  }

  Future<List<TaskModel>> getTasks() async {
    List<Map<String, dynamic>> taskMap = await database.query('lazydo');
    print('object');
    List<TaskModel> taskmodel =
        taskMap.map((e) => TaskModel(title: e['title'], id: e['id'])).toList();
    return taskmodel;
  }
}
