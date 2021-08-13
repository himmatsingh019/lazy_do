import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_do/constants/theme.dart';
import 'package:lazy_do/screens/home.dart';
import 'package:lazy_do/screens/login.dart';
import 'package:lazy_do/screens/my_day.dart';
import 'package:lazy_do/screens/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: getMaterialTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(email: ''),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/myday': (context) => MyDay(),
      },
    );
  }
}
