class TaskModel {
  String title = '';
  int? id = 0;

  TaskModel({required this.title, this.id});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
    };
  }
}
