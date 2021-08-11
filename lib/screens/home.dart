import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_do/constants/theme.dart';
import 'package:lazy_do/screens/login.dart';

class HomeScreen extends StatefulWidget {
  String? email = '';
  HomeScreen({Key? key, this.email}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorData.lightColor,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: ColorData.lightColor,
        ),
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
                            'Name',
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
        body: Padding(
          padding: EdgeInsets.only(left: 6),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: ListTile(
                  minLeadingWidth: 0,
                  leading: Icon(Icons.wb_sunny_outlined),
                  title: Text(
                    'My Day',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
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
                onTap: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
