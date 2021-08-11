import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_do/constants/theme.dart';
import 'package:lazy_do/screens/home.dart';
import 'package:lazy_do/screens/login.dart';
import 'package:lazy_do/screens/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: getMaterialTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
