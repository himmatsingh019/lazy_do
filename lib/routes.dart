import 'package:get/get.dart';
import 'package:lazy_do/screens/home.dart';
import 'package:lazy_do/screens/login.dart';
import 'package:lazy_do/screens/register.dart';
import 'package:lazy_do/screens/verify.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/register',
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
    ),
    GetPage(
      name: '/verify',
      page: () => VerfiyScreen(
        email: '',
      ),
    ),
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
    ),
  ];
}
