import 'package:get/get.dart';
import 'package:test_ta/Bindings/dashboardbinding.dart';
import 'package:test_ta/Bindings/loginbinding.dart';
import 'package:test_ta/Pages/dashboardpage.dart';
import 'package:test_ta/Pages/loginpage.dart';
import 'package:test_ta/Routes/routes.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: AppRoutes.loginPage, 
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
  name: AppRoutes.DASHBOARD,
  page: () => const Dashboardpage(),
  binding: Dashboardbinding(),
),
  ];
}