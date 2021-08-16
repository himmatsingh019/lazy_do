import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_do/constants/theme.dart';
import 'package:lazy_do/routes.dart';
import 'package:lazy_do/services/database/database_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(DatabaseHelper());
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
      getPages: AppRoutes.routes,
    );
  }
}
