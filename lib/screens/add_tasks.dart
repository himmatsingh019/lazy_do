import 'package:flutter/material.dart';
import 'package:lazy_do/constants/theme.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorData.primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Add a new Task',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 0.6,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(),
    );
  }
}
