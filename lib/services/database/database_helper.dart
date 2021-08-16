import 'dart:convert';

import 'package:get/get.dart';
import 'package:lazy_do/model/task_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper extends GetxController {
  late Database database;
  List<TaskModel> tasks = [];

  @override
  void onInit() async {
    super.onInit();
    database = await getDatabase();
    tasks = await getTasks();
    update();
  }

  Future<Database> getDatabase() async {
    return await openDatabase(
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
    await database.insert(
      'lazytodo',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    tasks = await getTasks();
    update();
  }

  void convert() {
    List<String> stringTask = [];
    tasks.forEach((task) {
      stringTask.add(jsonEncode(task.toMap()));
    });
    print(stringTask);
  }

  Future<void> removeTask(id) async {
    await database.rawDelete("DELETE FROM 'lazytodo' WHERE id = $id");
    tasks = await getTasks();
    update();
  }

  Future<List<TaskModel>> getTasks() async {
    List<Map<String, dynamic>> taskMap = await database.query('lazytodo');
    return taskMap
        .map((e) => TaskModel(title: e['title'], id: e['id']))
        .toList();
  }
}
