class TaskModel {
  String title = '';
  int? id = 0;
  // String description = '';

  TaskModel({required this.title, this.id});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      // "description": description,
    };
  }
}
