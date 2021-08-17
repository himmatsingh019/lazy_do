import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lazy_do/constants/theme.dart';
import 'package:lazy_do/model/task_model.dart';
import 'package:lazy_do/routes.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('lazydo');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: getMaterialTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: '/register',
      getPages: AppRoutes.routes,
    );
  }
}
