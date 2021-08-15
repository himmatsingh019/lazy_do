import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_do/services/database/database_helper.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final int delete;

  TaskCard({
    Key? key,
    required this.title,
    required this.delete,
  }) : super(key: key);

  DatabaseHelper _db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        child: Container(
          height: 100,
          padding: EdgeInsets.only(left: 12, top: 8),
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 2,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      _db.removeTask(id: delete, table: 'lazytodo');
                      Get.snackbar(
                        '',
                        'Task has been deleted',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    icon: Icon(Icons.delete_outline_outlined),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
