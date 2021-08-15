import 'package:get/get.dart';
import 'package:lazy_do/model/task_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper extends GetxController {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'lazytodo.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE lazytodo(id INTEGER PRIMARY KEY, title TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertTask(TaskModel task) async {
    Database _db = await database();
    await _db.insert(
      'lazytodo',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeTask({id, table}) async {
    Database _db = await database();

    await _db.rawDelete("DELETE FROM $table WHERE id = $id");
  }

  Future<List<TaskModel>> getTasks() async {
    Database _db = await database();
    List<Map<String, dynamic>> taskMap = await _db.query('lazytodo');
    print('object');
    List<TaskModel> taskmodel =
        taskMap.map((e) => TaskModel(title: e['title'], id: e['id'])).toList();
    return taskmodel;
  }
}
