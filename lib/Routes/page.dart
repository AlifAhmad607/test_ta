import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:test_ta/Pages/loginpage.dart';
import 'package:test_ta/Routes/routes.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: Approutes.loginPagge, 
      page: () => LoginPage(),
    )
  ];
}