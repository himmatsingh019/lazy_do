import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final VoidCallback ondelete;

  TaskCard({
    Key? key,
    required this.title,
    required this.ondelete,
  }) : super(key: key);

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
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
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
                    onPressed: ondelete,
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
