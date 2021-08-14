import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final VoidCallback onLongPress;
  const TaskCard({
    Key? key,
    required this.title,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Container(
        height: 140,
        padding: EdgeInsets.all(16),
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 6),
            // Text(
            //   description,
            //   maxLines: 2,
            //   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            // ),
          ],
        ),
      ),
    );
  }
}
