import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lazy_do/screens/home.dart';

class VerfiyScreen extends StatefulWidget {
  String email;
  String name;

  VerfiyScreen({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  _VerfiyScreenState createState() => _VerfiyScreenState();
}

class _VerfiyScreenState extends State<VerfiyScreen> {
  final auth = FirebaseAuth.instance;
  User? user;
  bool isLoading = false;
  late String email, name;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    user = auth.currentUser;
    user!.sendEmailVerification();
    setState(() {
      email = widget.email;
      name = widget.name;
    });

    Timer.periodic(Duration(seconds: 2), (timer) {
      verifyEmail(context, timer, email, name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Please verify your email to continue'),
                ],
              ),
            )
          : Container(),
    );
  }

  Future<void> verifyEmail(
      context, Timer timer, String email, String name) async {
    user = auth.currentUser;
    await user?.reload();
    if (user!.emailVerified) {
      timer.cancel();
      isLoading = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            email: email,
            name: name,
          ),
        ),
      );
    }
  }
}
