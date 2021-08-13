import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_do/constants/theme.dart';

class MyDay extends StatelessWidget {
  MyDay({Key? key}) : super(key: key);
  TextEditingController body = TextEditingController();
  List addToList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorData.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 90,
                    child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('Add a Task'),
                              content: TextField(
                                controller: body,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Create'),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Cancel'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          height: 52,
                          width: Get.width,
                          color: Colors.black87.withOpacity(.3),
                          child: ListTile(
                            leading: Icon(Icons.add),
                            title: Text(
                              'Add New Task',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
