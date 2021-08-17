import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  String title = '';
  @HiveField(1)
  int? id = 0;

  TaskModel({required this.title, this.id});

  // Map<String, dynamic> toMap() {
  //   return {
  //     "id": id,
  //     "title": title,
  //   };
  // }
}
