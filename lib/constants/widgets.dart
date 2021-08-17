import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskCard extends StatefulWidget {
  final String title;

  TaskCard({
    Key? key,
    required this.title,
    // required this.ondelete,
  }) : super(key: key);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool _isFav = false;

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
                widget.title,
                maxLines: 2,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    splashRadius: 1,
                    onPressed: () {
                      setState(() {
                        _isFav = true;
                      });
                    },
                    icon: Icon(Icons.star),
                    color: _isFav ? Colors.yellow[700] : Colors.black,
                  ),
                  IconButton(
                    splashRadius: 1,
                    onPressed: () {},
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
