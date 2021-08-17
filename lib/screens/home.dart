import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_do/constants/theme.dart';
import 'package:lazy_do/constants/widgets.dart';
import 'package:lazy_do/model/task_model.dart';
import 'package:lazy_do/screens/login.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  String? email = '';
  String? name = '';

  HomeScreen({Key? key, this.name, this.email}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController titleController = TextEditingController();
  final auth = FirebaseAuth.instance;
  late Box<TaskModel> taskModelBox;

  @override
  void initState() {
    super.initState();
    taskModelBox = Hive.box<TaskModel>('lazydo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorData.white_color,
      appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: ColorData.white_color),
      drawer: Drawer(
        elevation: 0,
        child: Container(
          padding: EdgeInsets.only(left: 2),
          color: ColorData.white_color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 8),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 36,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.name.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          widget.email.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: Text(
                  'SignOut',
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Add a Task'),
                  content: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your task here',
                      hintStyle: TextStyle(fontSize: 14),
                      contentPadding: EdgeInsets.only(left: 4),
                    ),
                    controller: titleController,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        if (titleController.text != '') {
                          TaskModel taskModel =
                              TaskModel(title: titleController.text);

                          taskModelBox.add(taskModel);
                          Get.back();
                          Get.snackbar(
                            'Task created',
                            '',
                            snackPosition: SnackPosition.BOTTOM,
                            duration: Duration(seconds: 1),
                          );
                        }
                      },
                      child: Text('Create'),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              );
            },
            child: ListTile(
              minLeadingWidth: 0,
              leading: Icon(Icons.add),
              title: Text(
                ' Add a new task',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // databaseHelper.convert();
            },
            child: ListTile(
              minLeadingWidth: 0,
              leading: Icon(Icons.star_border_outlined),
              title: Text(
                ' Important tasks',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Divider(
            indent: 20,
            endIndent: 30,
            thickness: 0.9,
            color: Colors.black,
          ),
          SizedBox(height: 20),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: taskModelBox.listenable(),
              builder: (context, Box<TaskModel> todos, _) {
                List<int> keys = todos.keys.cast<int>().toList();

                return ListView.separated(
                  itemCount: keys.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final int key = keys[index];
                    final TaskModel? tasks = todos.get(key);
                    return TaskCard(
                      title: tasks!.title,
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
